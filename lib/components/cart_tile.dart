import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/item.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/quantity_selector.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/cart_item.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/services/kiosk1_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Kiosk1Items>(
      builder: (context, kiosk1, child) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.item.imagePath,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.item.name),
                      Text('\$' + cartItem.item.price.toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      QuantitySelector(
                        quantity: cartItem.quantity,
                        item: cartItem.item,
                        onDecrement: () {
                          kiosk1.removeFromCart(cartItem);
                        },
                        onIncremenet: () {
                          kiosk1.addToCart(
                              cartItem.item, cartItem.selectedAddon);
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: cartItem.selectedAddon.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                children: cartItem.selectedAddon
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Row(
                            children: [
                              Text(addon.name),
                              Text(' (\₱${addon.price})'),
                            ],
                          ),
                          shape: StadiumBorder(
                              side: BorderSide(
                                  color: const Color.fromARGB(
                                      255, 205, 205, 205))),
                          onSelected: (value) {},
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          labelStyle: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
