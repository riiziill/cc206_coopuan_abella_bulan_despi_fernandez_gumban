import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/cart_tile.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/receipt_page.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/cart_item.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/services/kiosk1_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Kiosk1Items>(
      builder: (context, kiosk1, child) {
        final userCart = kiosk1.cart;

        return Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Are you sure you want to clear the cart?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              kiosk1.clearCart();
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text("Your cart is empty!"),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                final cartItem = userCart[index];

                                return MyCartTile(cartItem: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(350, 60),
                  backgroundColor: const Color(0xFF0A0170),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReceiptPage(),
                  ),
                ),
                child: const Text('CONFIRM ORDER'),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        );
      },
    );
  }
}
