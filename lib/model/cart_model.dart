import 'package:flutter/material.dart';

@immutable
class ShopItem {
  const ShopItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.color,
    this.unit = 'unit',
  });

  final String id;
  final String name;
  final double price;
  final String imagePath;
  final Color color;
  final String unit;
}

class CartModel extends ChangeNotifier {
  // Temporary local catalogue. Replace this with Firestore-backed products
  // when the marketplace repository is introduced.
  final List<ShopItem> _shopItems = const [
    ShopItem(
      id: 'seed-wheat',
      name: 'Wheat seeds',
      price: 420.0,
      imagePath: 'assets/images/ferti.jpeg',
      color: Colors.green,
      unit: '5 kg pack',
    ),
    ShopItem(
      id: 'seed-mustard',
      name: 'Mustard seeds',
      price: 260.0,
      imagePath: 'assets/images/doctor.jpeg',
      color: Colors.orange,
      unit: '2 kg pack',
    ),
    ShopItem(
      id: 'tool-sprayer',
      name: 'Hand sprayer',
      price: 850.0,
      imagePath: 'assets/images/owner.jpeg',
      color: Colors.blue,
      unit: 'piece',
    ),
    ShopItem(
      id: 'fertilizer-organic',
      name: 'Organic manure',
      price: 180.0,
      imagePath: 'assets/images/seller.png',
      color: Colors.brown,
      unit: '10 kg bag',
    ),
  ];

  final List<ShopItem> _cartItems = [];

  List<ShopItem> get shopItems => List.unmodifiable(_shopItems);
  List<ShopItem> get cartItems => List.unmodifiable(_cartItems);

  double get totalPrice =>
      _cartItems.fold(0.0, (total, item) => total + item.price);

  void addItemToCart(int index) {
    if (index < 0 || index >= _shopItems.length) {
      throw RangeError.index(index, _shopItems, 'index');
    }
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    if (index < 0 || index >= _cartItems.length) {
      throw RangeError.index(index, _cartItems, 'index');
    }
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    if (_cartItems.isEmpty) return;
    _cartItems.clear();
    notifyListeners();
  }

  // Kept for compatibility with the existing cart UI.
  String calculateTotal() => totalPrice.toStringAsFixed(2);
}
