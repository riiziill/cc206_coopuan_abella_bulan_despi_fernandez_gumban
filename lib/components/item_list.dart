import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/item.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/cart_item.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/receipt.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServiceItems extends ChangeNotifier {
  final List<Item> _menu = [
    Item(
      serviceName: "Kiosk 1",
      name: "Pork Adobo",
      description:
          "A savory and tangy pork stew marinated in soy sauce, vinegar, garlic, and spices.",
      imagePath: 'assets/pork_adobo.png',
      price: 150,
      category: Kiosk1ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Pork', price: 50),
      ],
    ),
    Item(
      serviceName: "Kiosk 1",
      name: "Sinigang",
      description:
          "A sour tamarind-based soup with tender pork and assorted vegetables.",
      imagePath: 'assets/sinigang.png',
      price: 180,
      category: Kiosk1ItemCategory.soup,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Pork', price: 50),
      ],
    ),
    Item(
      serviceName: "Kiosk 1",
      name: "Pancit Guisado",
      description:
          "Stir-fried noodles with a variety of vegetables, shrimp, pork, and chicken.",
      imagePath: 'assets/pancit.png',
      price: 120,
      category: Kiosk1ItemCategory.noodles,
      availableAddons: [
        Addon(name: 'Extra Shrimp', price: 40),
        Addon(name: 'Extra Pork', price: 30),
      ],
    ),
    Item(
      serviceName: "Kiosk 1",
      name: "Karekare",
      description:
          "A rich and creamy peanut-based stew with oxtail, tripe, and vegetables.",
      imagePath: 'assets/karekare.png',
      price: 250,
      category: Kiosk1ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Oxtail', price: 80),
      ],
    ),
    Item(
      serviceName: "Kiosk 1",
      name: "Lumpia Shanghai",
      description:
          "Crispy spring rolls filled with seasoned ground pork and vegetables.",
      imagePath: 'assets/lumpia.png',
      price: 90,
      category: Kiosk1ItemCategory.appetizer,
      availableAddons: [
        Addon(name: 'Extra Lumpia', price: 30),
      ],
    ),
    Item(
      serviceName: "Kiosk 1",
      name: "Bicol Express",
      description:
          "A spicy and creamy dish made with pork and shrimp cooked in coconut milk and chili.",
      imagePath: 'assets/bicol_express.png',
      price: 160,
      category: Kiosk1ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Pork', price: 50),
      ],
    ),
    Item(
      serviceName: "Kiosk 1",
      name: "Tocino",
      description:
          "Sweet, cured pork served with a side of garlic rice and fried egg.",
      imagePath: 'assets/tocino.png',
      price: 130,
      category: Kiosk1ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Fried Egg', price: 20),
      ],
    ),
    Item(
      serviceName: "Kiosk 1",
      name: "Pinakbet",
      description:
          "A vegetable medley of bitter melon, eggplant, and squash cooked with shrimp paste.",
      imagePath: 'assets/pinakbet.png',
      price: 120,
      category: Kiosk1ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Shrimp', price: 40),
      ],
    ),
    Item(
      serviceName: "Kiosk 1",
      name: "Caldereta",
      description:
          "A rich tomato-based beef stew with potatoes, carrots, and bell peppers.",
      imagePath: 'assets/caldereta.png',
      price: 200,
      category: Kiosk1ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Beef', price: 60),
      ],
    ),
    Item(
      serviceName: "Kiosk 1",
      name: "Bangus",
      description:
          "Grilled milkfish served with garlic rice and dipping sauce.",
      imagePath: 'assets/bangus.png',
      price: 150,
      category: Kiosk1ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Bangus', price: 60),
      ],
    ),
    Item(
      serviceName: "Kiosk 2",
      name: "Bistek",
      description:
          "Filipino beef steak marinated in soy sauce and calamansi, served with onions.",
      imagePath: 'assets/bistek.png',
      price: 170,
      category: Kiosk2ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Beef', price: 50),
      ],
    ),
    Item(
      serviceName: "Kiosk 2",
      name: "Afritada",
      description:
          "A tomato-based chicken stew with potatoes, carrots, and bell peppers.",
      imagePath: 'assets/afritada.png',
      price: 140,
      category: Kiosk2ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Chicken', price: 50),
      ],
    ),
    Item(
      serviceName: "Kiosk 2",
      name: "Dinuguan",
      description:
          "A savory stew made from pork offals, cooked in pig’s blood and vinegar.",
      imagePath: 'assets/dinuguan.png',
      price: 160,
      category: Kiosk2ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Pork', price: 50),
      ],
    ),
    Item(
      serviceName: "Kiosk 2",
      name: "Tinola",
      description:
          "A comforting chicken soup with ginger, papaya, and chili leaves.",
      imagePath: 'assets/tinola.png',
      price: 160,
      category: Kiosk2ItemCategory.soup,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Chicken', price: 50),
      ],
    ),
    Item(
      serviceName: "Kiosk 2",
      name: "Chopsuey",
      description:
          "A stir-fried vegetable medley with chicken, pork, and shrimp in a savory sauce.",
      imagePath: 'assets/chopsuey.png',
      price: 140,
      category: Kiosk2ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Shrimp', price: 40),
      ],
    ),
    Item(
      serviceName: "Kiosk 2",
      name: "Monggo",
      description: "A hearty mung bean soup with pork and vegetables.",
      imagePath: 'assets/monggo.png',
      price: 100,
      category: Kiosk2ItemCategory.soup,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Pork', price: 50),
      ],
    ),
    Item(
      serviceName: "Kiosk 2",
      name: "Tortang Talong",
      description:
          "Grilled eggplant made into a savory omelette, often served with ground pork.",
      imagePath: 'assets/talong.png',
      price: 120,
      category: Kiosk2ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Ground Pork', price: 30),
      ],
    ),
    Item(
      serviceName: "Kiosk 2",
      name: "Ampalaya",
      description:
          "Stir-fried bitter melon with eggs and onions, a healthy and slightly bitter dish.",
      imagePath: 'assets/ampalaya.png',
      price: 100,
      category: Kiosk2ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Eggs', price: 20),
      ],
    ),
    Item(
      serviceName: "Kiosk 2",
      name: "Fried Chicken",
      description:
          "Crispy fried chicken served with garlic rice and dipping sauce.",
      imagePath: 'assets/friedchicken.png',
      price: 160,
      category: Kiosk2ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Chicken', price: 50),
      ],
    ),
    Item(
      serviceName: "Kiosk 2",
      name: "Camotecue",
      description:
          "Deep-fried camote (sweet potato) served with a sugar syrup dip.",
      imagePath: 'assets/camotecue.png',
      price: 60,
      category: Kiosk2ItemCategory.snack,
      availableAddons: [],
    ),
    Item(
      serviceName: "Kiosk 3",
      name: "Batchoy",
      description:
          "A savory noodle soup with pork, beef, and a flavorful broth, topped with chicharron.",
      imagePath: 'assets/batchoy.png',
      price: 150,
      category: Kiosk3ItemCategory.soup,
      availableAddons: [
        Addon(name: 'Extra Pork', price: 50),
        Addon(name: 'Extra Noodles', price: 30),
      ],
    ),
    Item(
      serviceName: "Kiosk 3",
      name: "Chicken Inasal",
      description:
          "Grilled chicken marinated in a tangy and smoky mixture of vinegar, calamansi, and annatto.",
      imagePath: 'assets/inasal.png',
      price: 160,
      category: Kiosk3ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Chicken', price: 50),
      ],
    ),
    Item(
      serviceName: "Kiosk 3",
      name: "Pininyahang Manok",
      description:
          "A chicken stew with pineapple, carrots, and bell peppers in a creamy sauce.",
      imagePath: 'assets/pininyahang-manok.png',
      price: 180,
      category: Kiosk3ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Chicken', price: 50),
      ],
    ),
    Item(
      serviceName: "Kiosk 3",
      name: "Nilagang Baboy",
      description:
          "A clear, comforting soup made with pork and vegetables like corn, potatoes, and saba bananas.",
      imagePath: 'assets/nilaga.png',
      price: 170,
      category: Kiosk3ItemCategory.soup,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Pork', price: 50),
      ],
    ),
    Item(
      serviceName: "Kiosk 3",
      name: "Bulalo",
      description:
          "A beef shank soup with bone marrow, corn, and vegetables, simmered for hours for rich flavor.",
      imagePath: 'assets/bulalo.png',
      price: 220,
      category: Kiosk3ItemCategory.soup,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Beef', price: 80),
      ],
    ),
    Item(
      serviceName: "Kiosk 3",
      name: "Tocino",
      description: "Sweet, cured pork served with garlic rice and a fried egg.",
      imagePath: 'assets/tocino.png',
      price: 130,
      category: Kiosk3ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Fried Egg', price: 20),
      ],
    ),
    Item(
      serviceName: "Kiosk 3",
      name: "Pinakbet",
      description:
          "A vegetable medley of bitter melon, eggplant, and squash cooked with shrimp paste.",
      imagePath: 'assets/pinakbet.png',
      price: 120,
      category: Kiosk3ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Shrimp', price: 40),
      ],
    ),
    Item(
      serviceName: "Kiosk 3",
      name: "Afritada",
      description:
          "A tomato-based chicken stew with potatoes, carrots, and bell peppers.",
      imagePath: 'assets/afritada.png',
      price: 140,
      category: Kiosk3ItemCategory.main,
      availableAddons: [
        Addon(name: 'Rice', price: 20),
        Addon(name: 'Extra Chicken', price: 50),
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

    final sortedCart = _cart.toList()
      ..sort((a, b) => a.item.serviceName.compareTo(b.item.serviceName));

    String? currentServiceName;
    double serviceSubtotal = 0.0;

    for (int i = 0; i < sortedCart.length; i++) {
      final cartItem = sortedCart[i];

      if (currentServiceName != cartItem.item.serviceName) {
        if (currentServiceName != null) {
          receipt.writeln("Subtotal: ${_formatPrice(serviceSubtotal)}");
          receipt.writeln();
        }

        currentServiceName = cartItem.item.serviceName;
        serviceSubtotal = 0.0;
        receipt.writeln("Service: $currentServiceName");
        receipt.writeln("-----------------------");
      }

      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.item.name} - ${_formatPrice(cartItem.item.price)}");
      if (cartItem.selectedAddon.isNotEmpty) {
        receipt
            .writeln("     Add-ons: ${_formatAddon(cartItem.selectedAddon)}");
      }
      receipt.writeln();

      serviceSubtotal += cartItem.quantity * cartItem.item.price;

      for (var addon in cartItem.selectedAddon) {
        serviceSubtotal += addon.price * cartItem.quantity;
      }

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
