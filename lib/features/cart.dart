import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int adoboCount = 1;
  int riceCount = 2;
  int adoboPrice = 85;
  int ricePrice = 10;
  String orderOption = 'Dine In';
  String paymentMethod = 'Cash';

  int get totalPrice => (adoboCount * adoboPrice) + (riceCount * ricePrice);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Cart'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconButton(Icons.shopping_cart, Colors.blue, () {
                    print('Shopping cart button pressed');
                  }),
                  _buildIconButton(Icons.timer, Colors.grey, () {
                    print('Timer button pressed');
                  }),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Order Option',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                _buildOrderOption('Dine In'),
                _buildOrderOption('Take Out'),
              ],
            ),
            Divider(),
            Text(
              'Order',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _buildOrderItem('Chicken Adobo', adoboCount, adoboPrice, () {
              setState(() => adoboCount++);
            }, () {
              setState(() => adoboCount = adoboCount > 0 ? adoboCount - 1 : 0);
            }),
            _buildOrderItem('Rice', riceCount, ricePrice, () {
              setState(() => riceCount++);
            }, () {
              setState(() => riceCount = riceCount > 0 ? riceCount - 1 : 0);
            }),
            SizedBox(height: 10),
            Text('Total: ₱$totalPrice.00'),
            Divider(),
            Text(
              'Payment Method',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _buildPaymentOption('Cash'),
            _buildPaymentOption('Gcash'),
            _buildPaymentOption('Maya'),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('CONFIRM ORDER'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Color color, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: IconButton(
        icon: Icon(icon, size: 30, color: color),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildOrderOption(String option) {
    return Row(
      children: [
        Radio(
          value: option,
          groupValue: orderOption,
          onChanged: (value) {
            setState(() {
              orderOption = value!;
            });
          },
        ),
        Text(option),
      ],
    );
  }

  Widget _buildOrderItem(
      String name, int count, int price, VoidCallback onAdd, VoidCallback onRemove) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.network(
              'https://via.placeholder.com/50',
              width: 50,
              height: 50,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text('₱$price.00'),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: onRemove,
            ),
            Text('$count'),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: onAdd,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentOption(String option) {
    return Row(
      children: [
        Radio(
          value: option,
          groupValue: paymentMethod,
          onChanged: (value) {
            setState(() {
              paymentMethod = value!;
            });
          },
        ),
        Text(option),
      ],
    );
  }
}
