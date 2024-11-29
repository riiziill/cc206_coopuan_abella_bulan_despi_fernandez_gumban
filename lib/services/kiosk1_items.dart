import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/item.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/cart_item.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/receipt.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Kiosk1Items extends ChangeNotifier {
  final List<Item> _menu = [
    //Category 1
    Item(
      name: "Borgor",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: ItemCategory.category1,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    Item(
      name: "Borgor2",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: ItemCategory.category1,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    Item(
      name: "Borgor3",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: ItemCategory.category1,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    //Category 2

    Item(
      name: "Cheez",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: ItemCategory.category2,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    Item(
      name: "Cheez",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: ItemCategory.category2,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    //Category 3

    Item(
      name: "Piqls",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: ItemCategory.category3,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),
  ];

  List<Item> get menu => _menu;
  List<CartItem> get cart => _cart;

  final List<CartItem> _cart = [];

  void addToCart(Item items, List<Addon> selectedAddon) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameItem = item.item == items;

      bool isSameAddon =
          ListEquality().equals(item.selectedAddon, selectedAddon);

      return isSameItem && isSameAddon;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(item: items, selectedAddon: selectedAddon),
      );
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (_cart[cartIndex].quantity > 1) {
      _cart[cartIndex].quantity--;
    } else {
      _cart.removeAt(cartIndex);
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.item.price;

      for (Addon addon in cartItem.selectedAddon) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Your Receipt.");
    receipt.writeln();

    String formatDate =
        DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());

    receipt.writeln(formatDate);
    receipt.writeln();
    receipt.writeln("-----------------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.item.name} - ${_formatPrice(cartItem.item.price)}");
      if (cartItem.selectedAddon.isNotEmpty) {
        receipt
            .writeln("     Add-ons: ${_formatAddon(cartItem.selectedAddon)}");
      }
      receipt.writeln();
    }

    receipt.writeln("-----------------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  String _formatPrice(double price) {
    return "₱${price.toStringAsFixed(2)}";
  }

  String _formatAddon(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
