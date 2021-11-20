import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/formulario_transferencia.dart';
import 'package:bytebank/screens/item_transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  ListaTransferencias({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências '),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, index) {
          final transferencia = widget._transferencias[index];
          debugPrint('$transferencia');
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint('chegou no then do future');
            debugPrint('$transferenciaRecebida');
            if (transferenciaRecebida != null) {
              debugPrint('add _transferencias');

              setState(() {
                widget._transferencias.add(transferenciaRecebida);
              });
              debugPrint(widget._transferencias.length.toString());
            }
          });
        },
      ),
    );
  }
}
