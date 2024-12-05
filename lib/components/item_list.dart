import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/item.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/cart_item.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/receipt.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServiceItems extends ChangeNotifier {
  final List<Item> _menu = [
    //Kiosk 1
    //Category 1
    Item(
      serviceName: "Kiosk 1",
      name: "Borgor",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk1ItemCategory.category1,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    Item(
      serviceName: "Kiosk 1",
      name: "Borgor2",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk1ItemCategory.category1,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    Item(
      serviceName: "Kiosk 1",
      name: "Borgor3",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk1ItemCategory.category1,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    //Category 2

    Item(
      serviceName: "Kiosk 1",
      name: "Cheez",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk1ItemCategory.category2,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    Item(
      serviceName: "Kiosk 1",
      name: "Cheez",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk1ItemCategory.category2,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    //Category 3

    Item(
      serviceName: "Kiosk 1",
      name: "Piqls",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk1ItemCategory.category3,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    //Kiosk 2
    //Category 1
    Item(
      serviceName: "Kiosk 2",
      name: "Borgor",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk2ItemCategory.kiosk2CategoryX,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    Item(
      serviceName: "Kiosk 2",
      name: "Borgor2",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk2ItemCategory.kiosk2CategoryX,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    Item(
      serviceName: "Kiosk 2",
      name: "Borgor3",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk2ItemCategory.kiosk2CategoryX,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    //Category 2

    Item(
      serviceName: "Kiosk 2",
      name: "Cheez",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk2ItemCategory.kiosk2CategoryY,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    Item(
      serviceName: "Kiosk 2",
      name: "Cheez",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk2ItemCategory.kiosk2CategoryY,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    //Category 3

    Item(
      serviceName: "Kiosk 2",
      name: "Piqls",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk2ItemCategory.kiosk2CategoryZ,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    //Kiosk 3
    //Category 1
    Item(
      serviceName: "Kiosk 3",
      name: "adoasld",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk3ItemCategory.kiosk3CategoryX,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    Item(
      serviceName: "Kiosk 3",
      name: "Borgor2",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk3ItemCategory.kiosk3CategoryX,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    Item(
      serviceName: "Kiosk 3",
      name: "Borgor3",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk3ItemCategory.kiosk3CategoryX,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    //Category 2

    Item(
      serviceName: "Kiosk 3",
      name: "Cheez",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk3ItemCategory.kiosk3CategoryY,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    Item(
      serviceName: "Kiosk 3",
      name: "Cheez",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk3ItemCategory.kiosk3CategoryY,
      availableAddons: [
        Addon(name: 'piqls', price: 10000),
        Addon(name: 'toms', price: 2),
        Addon(name: 'kets', price: 3),
      ],
    ),

    //Category 3

    Item(
      serviceName: "Kiosk 3",
      name: "Piqls",
      description: "Cheez",
      imagePath: 'assets/kiosk1.png',
      price: 99,
      category: Kiosk3ItemCategory.kiosk3CategoryZ,
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

    // Sort the cart items by serviceName
    final sortedCart = _cart.toList()
      ..sort((a, b) => a.item.serviceName.compareTo(b.item.serviceName));

    String? currentServiceName;
    double serviceSubtotal = 0.0;

    for (int i = 0; i < sortedCart.length; i++) {
      final cartItem = sortedCart[i];

      // Check if the serviceName changes to add a header
      if (currentServiceName != cartItem.item.serviceName) {
        // If this is not the first group, display the subtotal for the previous service
        if (currentServiceName != null) {
          receipt.writeln("Subtotal: ${_formatPrice(serviceSubtotal)}");
          receipt.writeln();
        }

        currentServiceName = cartItem.item.serviceName;
        serviceSubtotal = 0.0; // Reset subtotal for the new service
        receipt.writeln("Service: $currentServiceName");
        receipt.writeln("-----------------------");
      }

      // Add item details to the receipt
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.item.name} - ${_formatPrice(cartItem.item.price)}");
      if (cartItem.selectedAddon.isNotEmpty) {
        receipt
            .writeln("     Add-ons: ${_formatAddon(cartItem.selectedAddon)}");
      }
      receipt.writeln();

      // Add the item price to the current service's subtotal
      serviceSubtotal += cartItem.quantity * cartItem.item.price;

      // Add the add-ons' prices to the subtotal
      for (var addon in cartItem.selectedAddon) {
        serviceSubtotal += addon.price * cartItem.quantity;
      }

      // If this is the last item in the list, print the subtotal for the last service
      if (i == sortedCart.length - 1) {
        receipt.writeln("Service Subtotal: ${_formatPrice(serviceSubtotal)}");
        receipt.writeln();
      }
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
