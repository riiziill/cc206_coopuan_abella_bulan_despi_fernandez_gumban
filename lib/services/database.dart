import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  final CollectionReference orderHistory =
      FirebaseFirestore.instance.collection('orderHistory');

  final CollectionReference userNotifications =
      FirebaseFirestore.instance.collection('userNotifications');

  final currentUser = FirebaseAuth.instance.currentUser!;

  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      'userEmail': currentUser.email,
      'date': DateTime.now(),
      'order': receipt,
    });
  }

  Future<void> orderConfirmedNotif() async {
    await userNotifications.add({
      'userEmail': currentUser.email,
      'date': DateTime.now(),
      'message':
          "Your order has been completed. Thank you for choosing DigiCoop",
    });
  }

  Future<void> orderCancelledNotif() async {
    await userNotifications.add({
      'userEmail': currentUser.email,
      'date': DateTime.now(),
      'message': "Your order was cancelled.",
    });
  }
}
