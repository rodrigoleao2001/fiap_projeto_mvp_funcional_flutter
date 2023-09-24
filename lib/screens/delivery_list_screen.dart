// screens/delivery_list_screen.dart
import 'package:flutter/material.dart';
import 'package:projeto_static_void_flutter/api/delivery_api.dart';
import 'package:projeto_static_void_flutter/models/delivery.dart';

class DeliveryListScreen extends StatefulWidget {
  @override
  _DeliveryListScreenState createState() => _DeliveryListScreenState();
}

class _DeliveryListScreenState extends State<DeliveryListScreen> {
  List<Delivery> deliveries = [];
  final _api = DeliveryAPI();

  @override
  void initState() {
    super.initState();
    _loadDeliveries();
  }

  Future<void> _loadDeliveries() async {
    try {
      List<Delivery> fetchedDeliveries = await _api.listDeliveries();
      setState(() {
        deliveries = fetchedDeliveries;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading deliveries: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Solicitações'),
        backgroundColor: Colors.blueGrey,
      ),
      body: deliveries.isEmpty
          ? Center(child: Text('Nenhuma solicitação encontrada'))
          : ListView.builder(
              itemCount: deliveries.length,
              itemBuilder: (context, index) {
                final delivery = deliveries[index];
                return ListTile(
                  title: Text(delivery.description),
                  subtitle: Text(delivery.status),
                );
              },
            ),
    );
  }
}
