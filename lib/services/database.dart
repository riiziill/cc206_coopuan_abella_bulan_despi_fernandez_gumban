import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  final CollectionReference orderHistory =
      FirebaseFirestore.instance.collection('orderHistory');

  final currentUser = FirebaseAuth.instance.currentUser!;

  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      'userEmail': currentUser.email,
      'date': DateTime.now(),
      'order': receipt,
    });
  }
}
