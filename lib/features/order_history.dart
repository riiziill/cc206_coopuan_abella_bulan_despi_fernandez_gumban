import 'package:flutter/material.dart';

class OrderHistory extends StatelessWidget {
  final List<Map<String, String>> orderHistory = [
    {
      'title': 'Order #1234',
      'content': 'Completed on Oct 10, 2024',
      'status': 'Completed'
    },
    {
      'title': 'Order #1235',
      'content': 'Cancelled on Oct 15, 2024',
      'status': 'Cancelled'
    },
    {
      'title': 'Order #1236',
      'content': 'Pending since Nov 1, 2024',
      'status': 'Pending'
    },
    {
      'title': 'Order #1237',
      'content': 'Completed on Nov 5, 2024',
      'status': 'Completed'
    },
    {
      'title': 'Order #1238',
      'content': 'Cancelled on Nov 10, 2024',
      'status': 'Cancelled'
    },
  ];

  IconData _getIcon(String status) {
    switch (status) {
      case 'Completed':
        return Icons.check_circle;
      case 'Cancelled':
        return Icons.cancel;
      case 'Pending':
      default:
        return Icons.hourglass_top;
    }
  }

  Color _getIconColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Cancelled':
        return Colors.red;
      case 'Pending':
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: ListView.builder(
        itemCount: orderHistory.length,
        itemBuilder: (context, index) {
          final order = orderHistory[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Icon(
                _getIcon(order['status']!),
                color: _getIconColor(order['status']!),
              ),
              title: Text(
                order['title']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(order['content']!),
              trailing: Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}
