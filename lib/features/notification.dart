import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Order Confirmed',
      'content': 'Your order has been confirmed and is being prepared.'
    },
    {
      'title': 'Promo Alert',
      'content': 'Check out our new promos in the Fast Food section!'
    },
    {
      'title': 'Order Completed',
      'content': 'Your order is complete. Thank you for choosing DigiCoop!'
    },
    {
      'title': 'Service Update',
      'content':
          'The Print service is available now from 8:00 A.M. to 5:00 P.M.'
    },
    {
      'title': 'Membership Reward',
      'content': 'You have received a reward! Use it on your next purchase.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading:
                  Icon(Icons.notifications, color: Colors.deepPurpleAccent),
              title: Text(notifications[index]['title']!,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(notifications[index]['content']!),
              trailing: Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}
