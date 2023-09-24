import 'package:flutter/material.dart';
import 'package:projeto_static_void_flutter/api/carrier_api.dart';
import 'package:projeto_static_void_flutter/models/carrier.dart';

class CarrierListScreen extends StatefulWidget {
  @override
  _CarrierListScreenState createState() => _CarrierListScreenState();
}

class _CarrierListScreenState extends State<CarrierListScreen> {
  List<Carrier> carriers = []; // Initialize with empty list
  final _api = CarrierAPI();

  @override
  void initState() {
    super.initState();
    _loadCarriers();
  }

  Future<void> _loadCarriers() async {
    try {
      List<Carrier> fetchedCarriers =
          await _api.listCarriers(); // Remove the nullable sign '?'
      setState(() {
        carriers = fetchedCarriers;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error loading carriers: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Carriers'),
        backgroundColor: Colors.blueGrey,
      ),
      body: RefreshIndicator(
        onRefresh: _loadCarriers,
        child: ListView.builder(
          itemCount: carriers.length,
          itemBuilder: (context, index) {
            final carrier = carriers[index];
            return ListTile(
              leading: Icon(Icons.local_shipping, color: Colors.blueGrey),
              title: Text(carrier.nome),
              subtitle: Text(carrier.placaVeiculo),
            );
          },
        ),
      ),
    );
  }
}
