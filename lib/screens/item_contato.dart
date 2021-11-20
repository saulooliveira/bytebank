import 'package:bytebank/models/contato.dart';
import 'package:flutter/material.dart';

class ContatoItem extends StatelessWidget {
  final Contato contato;
  final void Function(int) callbackDelete;

  const ContatoItem(this.contato, this.callbackDelete, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: const TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  contato.conta.toString(),
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: const Text('delete'),
                  onPressed: () => callbackDelete(contato.id ?? 0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
