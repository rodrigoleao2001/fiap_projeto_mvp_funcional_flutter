import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_static_void_flutter/models/delivery.dart';

class DeliveryAPI {
  final _firestore = FirebaseFirestore.instance;
  final _collectionName = 'deliveries'; // O nome da coleção no Firestore

  Future<List<Delivery>> listDeliveries() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection(_collectionName).get();
      List<Delivery> deliveries = [];

      for (var doc in snapshot.docs) {
        deliveries.add(Delivery.fromMap(doc.data() as Map<String, dynamic>));
      }

      return deliveries;
    } catch (e) {
      throw Exception('Failed to load deliveries: $e');
    }
  }

  Future<void> createDelivery(Delivery delivery) async {
    await _firestore.collection(_collectionName).add(delivery.toJson());
  }



  Future<void> updateDeliveryById(String docId, Delivery delivery) async {
    await _firestore
        .collection(_collectionName)
        .doc(docId)
        .update(delivery.toJson());
  }

  Future<void> deleteDeliveryById(String docId) async {
    await _firestore.collection(_collectionName).doc(docId).delete();
  }
}
