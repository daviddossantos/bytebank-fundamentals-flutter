import 'package:bytebank/components/input.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _TituloAppBar = "Criando Transferência";
const _rotuloCampoValor = "Valor";
const _dicaCampoValor = "0.00";

const _rotuloCampoConta = "Número da conta";
const _dicaCampoConta = "0000";

const _TextoBotaoConfirmar = "CONFIRMAR";

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController controladorCampoNumeroConta =
      TextEditingController();

  final TextEditingController controladorCampoValor = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_TituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Input(
              controlador: controladorCampoNumeroConta,
              dica: _dicaCampoConta,
              rotulo: _rotuloCampoConta,
              icone: Icons.account_balance_sharp,
            ),
            Input(
              controlador: controladorCampoValor,
              dica: _dicaCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            FractionallySizedBox(
              widthFactor: 0.9,
              child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(300, 50)),
                ),
                onPressed: () => _criaTransferencia(context),
                child: Text(_TextoBotaoConfirmar,
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _exibirDialogo(BuildContext context) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Campos obrigatórios'),
              content: const Text('Numero da conta e/ou valor não informado.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));
  }

  void _criaTransferencia(BuildContext context) {
    final numeroConta = controladorCampoNumeroConta.text;
    final valor = controladorCampoValor.text;

    if (numeroConta.isNotEmpty && valor.isNotEmpty) {
      final int numeroContaParse = int.parse(numeroConta);
      final double valorParse = double.parse(valor);
      final transferenciaCriada = Transferencia(valorParse, numeroContaParse);
      Navigator.pop(context, transferenciaCriada);
      return;
    }

    _exibirDialogo(context);
  }
}
