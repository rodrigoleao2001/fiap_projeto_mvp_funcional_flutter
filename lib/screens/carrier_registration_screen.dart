import 'package:flutter/material.dart';
import 'package:projeto_static_void_flutter/api/carrier_api.dart';
import 'package:projeto_static_void_flutter/models/carrier.dart';
import 'package:projeto_static_void_flutter/widgets/custom_text_form_field.dart';
import 'package:projeto_static_void_flutter/screens/carrier_list_screen.dart'; // Make sure to import the CarrierListScreen

class CarrierRegistrationScreen extends StatefulWidget {
  @override
  _CarrierRegistrationScreenState createState() =>
      _CarrierRegistrationScreenState();
}

class _CarrierRegistrationScreenState extends State<CarrierRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _carrier = Carrier(nome: '', placaVeiculo: '', idCliente: '');
  final _api = CarrierAPI();

  _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await _api.createCarrier(_carrier);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Carrier registered successfully!')));
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => CarrierListScreen()));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Error registering carrier. Please try again.')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Carrier'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                label: 'Name',
                icon: Icons.person,
                onSaved: (value) => _carrier.nome = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Name is required' : null,
              ),
              SizedBox(height: 16.0),
              CustomTextFormField(
                label: 'Vehicle Plate',
                icon: Icons.drive_eta,
                onSaved: (value) => _carrier.placaVeiculo = value!,
                validator: (value) =>
                    value!.isEmpty ? 'Vehicle Plate is required' : null,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  onPrimary: Colors.white,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
