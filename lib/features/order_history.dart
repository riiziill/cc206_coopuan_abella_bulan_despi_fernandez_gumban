import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class OrderHistory extends StatelessWidget {
  Future<List<Map<String, dynamic>>> getOrderHistory() async {
    String userEmail = FirebaseAuth.instance.currentUser!.email!;

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('userEmail', isEqualTo: userEmail)
        .get();

    List<Map<String, dynamic>> orders = [];
    for (var doc in querySnapshot.docs) {
      var orderData = doc.data() as Map<String, dynamic>;

      Timestamp timestamp = orderData['date'] as Timestamp;
      DateTime dateTime = timestamp.toDate();
      String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);

      orders.add({
        'date': formattedDate,
        'order': orderData['order'],
      });
    }
    return orders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Order History'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getOrderHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error fetching orders'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No orders found'));
          }

          var orders = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        title: Text(
                          'Order placed on: ${order['date']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(order['order']!.substring(0, 30) +
                            '...'), // Show part of the order details
                        onTap: () {
                          // Navigate to order detail screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OrderDetailScreen(order: order),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class OrderDetailScreen extends StatelessWidget {
  final Map<String, dynamic> order;

  OrderDetailScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Date: ${order['date']}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Order Details:\n${order['order']}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
