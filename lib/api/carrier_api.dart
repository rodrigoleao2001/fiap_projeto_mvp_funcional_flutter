import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_static_void_flutter/models/carrier.dart';

class CarrierAPI {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para listar transportadores
  Future<List<Carrier>> listCarriers() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection('transportadores').get();
      return snapshot.docs
          .map((doc) => Carrier.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to load carriers: $e');
    }
  }

  // Método para criar um novo transportador
  Future<void> createCarrier(Carrier carrier) async {
    try {
      await _firestore.collection('transportadores').add(carrier.toJson());
    } catch (e) {
      throw Exception('Failed to create carrier: $e');
    }
  }
}
