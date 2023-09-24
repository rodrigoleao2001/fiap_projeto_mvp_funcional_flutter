import 'package:flutter/material.dart';
import 'package:projeto_static_void_flutter/api/delivery_api.dart';
import 'package:projeto_static_void_flutter/models/delivery.dart';

class DeliveryRequestScreen extends StatefulWidget {
  @override
  _DeliveryRequestScreenState createState() => _DeliveryRequestScreenState();
}

class _DeliveryRequestScreenState extends State<DeliveryRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _api = DeliveryAPI();

  String _description = '';
  String _originAddress = '';
  String _destinationAddress = '';
  int _weight = 0;

  _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Delivery newDelivery = Delivery(
        description: _description,
        originAddress: _originAddress,
        destinationAddress: _destinationAddress,
        weight: _weight,
        status: 'Aguardando motorista',
      );

      try {
        await _api.createDelivery(newDelivery);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Solicitação de entrega enviada com sucesso!')));
        Navigator.of(context).pop();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Erro ao enviar a solicitação. Por favor, tente novamente.')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitar Entrega'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField(
                  label: 'Endereço de Origem',
                  onSaved: (value) => _originAddress = value!,
                ),
                SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Endereço de Destino',
                  onSaved: (value) => _destinationAddress = value!,
                ),
                SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Peso (em kg)',
                  inputType: TextInputType.number,
                  onSaved: (value) => _weight = int.parse(value!),
                ),
                SizedBox(height: 16.0),
                _buildTextField(
                  label: 'Descrição',
                  onSaved: (value) => _description = value!,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Enviar'),
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
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    TextInputType? inputType,
    required FormFieldSetter<String> onSaved,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      keyboardType: inputType,
      onSaved: onSaved,
      validator: (value) {
        if (value!.isEmpty) {
          return '$label é obrigatório';
        }
        if (inputType == TextInputType.number && int.tryParse(value) == null) {
          return 'Por favor, insira um número válido';
        }
        return null;
      },
    );
  }
}
