import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/item.dart';

class CartItem {
  Item item;
  List<Addon> selectedAddon;
  int quantity;

  CartItem({
    required this.item,
    required this.selectedAddon,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonsPrice =
        selectedAddon.fold(0, (sum, addon) => sum + addon.price);
    return (item.price + addonsPrice) * quantity;
  }
}
