import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/cart_tile.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/receipt_page.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/item_list.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/services/database.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  FirestoreService db = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceItems>(
      builder: (context, kiosk, child) {
        final userCart = kiosk.cart;

        final sortedCart = userCart.toList()
          ..sort((a, b) => a.item.serviceName.compareTo(b.item.serviceName));

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
                            kiosk.clearCart();
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              )
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
                              itemCount: sortedCart.length,
                              itemBuilder: (context, index) {
                                final cartItem = sortedCart[index];

                                final isFirstItemInServiceGroup = index == 0 ||
                                    sortedCart[index - 1].item.serviceName !=
                                        cartItem.item.serviceName;

                                return Column(
                                  children: [
                                    if (isFirstItemInServiceGroup)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Column(
                                          children: [
                                            Text(
                                              cartItem.item.serviceName,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.grey,
                                              thickness: 1,
                                              indent: 20,
                                              endIndent: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    MyCartTile(cartItem: cartItem),
                                  ],
                                );
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
                onPressed: () async {
                  bool shouldProceed = await showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Row(
                              children: [
                                Icon(Icons.warning, color: Colors.orange),
                                const SizedBox(width: 10),
                                const Text("Confirm Order"),
                              ],
                            ),
                            content: const Text(
                              "Are you sure you want to confirm your order?",
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  db.orderCancelledNotif();
                                  Navigator.pop(context, false);
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Continue'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;

                  if (shouldProceed) {
                    db.orderConfirmedNotif();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReceiptPage(),
                      ),
                    );
                  }
                },
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
