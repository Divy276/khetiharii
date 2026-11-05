import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/crop_listing.dart';
import '../models/marketplace_order.dart';
import 'marketplace_repository.dart';

class FirestoreMarketplaceRepository implements MarketplaceRepository {
  FirestoreMarketplaceRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  @override
  Stream<List<CropListing>> watchActiveListings({String? search}) {
    Query<Map<String, dynamic>> query = _db
        .collection('crop_listings')
        .where('status', isEqualTo: ListingStatus.active.name)
        .orderBy('createdAt', descending: true)
        .limit(50);
    final term = search?.trim().toLowerCase() ?? '';
    if (term.isNotEmpty) {
      query = _db
          .collection('crop_listings')
          .where('status', isEqualTo: ListingStatus.active.name)
          .orderBy('cropNameLower')
          .startAt([term])
          .endAt(['$term\uf8ff'])
          .limit(50);
    }
    return query.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => CropListing.fromMap(doc.id, doc.data()))
              .toList(growable: false),
        );
  }

  @override
  Future<void> createListing(CropListing listing) async {
    await _db.collection('crop_listings').add(listing.toMap());
  }

  @override
  Future<void> placeOrder({
    required CropListing listing,
    required String buyerId,
    required double quantity,
  }) async {
    if (quantity <= 0 || quantity > listing.quantity) {
      throw ArgumentError('Enter a quantity available in this listing.');
    }
    final order = _db.collection('marketplace_orders').doc();
    final listingRef = _db.collection('crop_listings').doc(listing.id);
    await _db.runTransaction((transaction) async {
      final snapshot = await transaction.get(listingRef);
      if (!snapshot.exists) throw StateError('This listing no longer exists.');
      final current = CropListing.fromMap(snapshot.id, snapshot.data()!);
      if (current.status != ListingStatus.active || quantity > current.quantity) {
        throw StateError('The requested quantity is no longer available.');
      }
      transaction.set(order, {
        'listingId': listing.id,
        'buyerId': buyerId,
        'farmerId': listing.farmerId,
        'cropName': listing.cropName,
        'quantity': quantity,
        'unit': listing.unit,
        'unitPrice': listing.pricePerUnit,
        'totalPrice': quantity * listing.pricePerUnit,
        'status': OrderStatus.requested.name,
        'createdAt': FieldValue.serverTimestamp(),
      });
      final remaining = current.quantity - quantity;
      transaction.update(listingRef, {
        'quantity': remaining,
        if (remaining == 0) 'status': ListingStatus.reserved.name,
      });
    });
  }

  @override
  Stream<List<MarketplaceOrder>> watchOrdersForUser(String uid) =>
      _db.collection('marketplace_orders')
          .where('buyerId', isEqualTo: uid)
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => MarketplaceOrder.fromMap(doc.id, doc.data()))
              .toList(growable: false));

  @override
  Future<void> updateOrderStatus({
    required String orderId,
    required String farmerId,
    required String status,
  }) async {
    if (!['accepted', 'rejected', 'completed'].contains(status)) {
      throw ArgumentError('Unsupported order status.');
    }
    final ref = _db.collection('marketplace_orders').doc(orderId);
    await _db.runTransaction((transaction) async {
      final snapshot = await transaction.get(ref);
      if (!snapshot.exists || snapshot.data()?['farmerId'] != farmerId) {
        throw StateError('Order not found or permission denied.');
      }
      transaction.update(ref, {'status': status});
    });
  }
}
