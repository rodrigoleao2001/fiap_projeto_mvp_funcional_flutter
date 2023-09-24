import 'package:flutter/material.dart';
import 'package:projeto_static_void_flutter/screens/carrier_registration_screen.dart';
import 'package:projeto_static_void_flutter/screens/carrier_list_screen.dart';
import 'package:projeto_static_void_flutter/screens/delivery_request_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('T-Envia'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildOptionCard(
              title: 'Registrar Transportadora',
              icon: Icons.person_add_rounded,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CarrierRegistrationScreen())),
            ),
            SizedBox(height: 20),
            _buildOptionCard(
              title: 'Listar Transportadoras',
              icon: Icons.list_rounded,
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CarrierListScreen())),
            ),
            SizedBox(height: 20),
            _buildOptionCard(
              title: 'Solicitar Entrega',
              icon: Icons.local_shipping_rounded,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DeliveryRequestScreen())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required String title,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 5,
        shadowColor: Colors.blueGrey.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.blueGrey.shade200, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Icon(icon, size: 50, color: Colors.blueGrey),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
