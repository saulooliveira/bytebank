import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  @override
  State createState() => FormularioTransferenciaState();
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: 'Número da conta',
                dica: '0000'),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: 'Valor',
                dica: '0.00',
                icone: Icons.monetization_on),
            ElevatedButton(
              child: const Text('Confirmar'),
              onPressed: () => criarTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void criarTransferencia(BuildContext context) {
    debugPrint('clicou no confirmar');
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        padding: EdgeInsets.all(16.0),
        content: Text(
          'Tranferência Criada',
          style: TextStyle(fontSize: 16.0),
        ),
      ));

      Navigator.pop(context, transferenciaCriada);
    }
  }
}
