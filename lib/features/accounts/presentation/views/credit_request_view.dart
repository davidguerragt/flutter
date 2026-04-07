import 'package:flutter/material.dart';

class CreditRequestView extends StatelessWidget {
  CreditRequestView({super.key});
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Solicita tu crédito')),
      body: Column(
        children: [
          Text('Ingresa tu nombre para calcular tu crédito'),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(hintText: 'Nombre'),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Calcular crédito')),
          TextButton(onPressed: () {}, child: Text('reintentar')),
        ],
      ),
    );
  }
}
