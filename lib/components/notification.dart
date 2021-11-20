import 'package:flutter/material.dart';

enum DialogResult { yes, no }

Future<DialogResult> showMyDialog(context) async {
  final DialogResult? result = await showDialog<DialogResult>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Excluir'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[Text('Deseja excluir o contato?')],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Sim'),
            onPressed: () => Navigator.pop(context, DialogResult.yes),
          ),
          TextButton(
            child: const Text('Não'),
            onPressed: () => Navigator.pop(context, DialogResult.no),
          ),
        ],
      );
    },
  );

  return result ?? DialogResult.no;
}
