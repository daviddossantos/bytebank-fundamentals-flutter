import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Input(
      {required this.controlador,
      required this.dica,
      required this.rotulo,
      required this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: rotulo, hintText: dica, icon: Icon(icone)),
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
