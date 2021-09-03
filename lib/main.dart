import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListTransferencias(),
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
            primary: Colors.deepPurple,
            secondary: Colors.deepPurple,
            brightness: Brightness.light),
        primaryColor: Colors.deepPurple,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepPurple))),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
