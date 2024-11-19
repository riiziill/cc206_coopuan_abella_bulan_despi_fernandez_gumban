import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Receipt'),
        ),
        body: ReceiptScreen(),
      ),
    );
  }
}

class ReceiptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'Kent Jasper Abella',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text('2022M0100'),
                Text('BSIT 3 A'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Item', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Qnty.', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Chicken Adobo'),
              Text('1x'),
              Text('85.00'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rice'),
              Text('2x'),
              Text('10.00'),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 20),
              Text('105.00 Php', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Spacer(),
          Center(
            child: Column(
              children: [
                Text('Sep 23, 2024 12:54 PM'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('CONTINUE'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
