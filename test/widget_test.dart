import 'package:flutter_test/flutter_test.dart';
import 'package:khetiharii/model/cart_model.dart';

void main() {
  group('CartModel', () {
    test('starts with an empty cart and a catalogue', () {
      final cart = CartModel();

      expect(cart.cartItems, isEmpty);
      expect(cart.shopItems, isNotEmpty);
      expect(cart.totalPrice, 0);
    });

    test('adds an item and updates the total', () {
      final cart = CartModel();
      var notifications = 0;
      cart.addListener(() => notifications++);

      cart.addItemToCart(0);

      expect(cart.cartItems, hasLength(1));
      expect(cart.totalPrice, cart.shopItems.first.price);
      expect(notifications, 1);
    });

    test('removes an item and resets the total', () {
      final cart = CartModel()..addItemToCart(0);

      cart.removeItemFromCart(0);

      expect(cart.cartItems, isEmpty);
      expect(cart.totalPrice, 0);
    });

    test('clears multiple items', () {
      final cart = CartModel()
        ..addItemToCart(0)
        ..addItemToCart(1);

      cart.clearCart();

      expect(cart.cartItems, isEmpty);
      expect(cart.totalPrice, 0);
    });

    test('rejects an invalid catalogue index', () {
      final cart = CartModel();

      expect(() => cart.addItemToCart(100), throwsRangeError);
    });
  });
}
