import 'package:bytebank/components/notification.dart';
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contato.dart';
import 'package:bytebank/screens/formulario_contato.dart';
import 'package:bytebank/screens/item_contato.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatefulWidget {
  const ListaContatos({Key? key}) : super(key: key);

  @override
  _ListaContatosState createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato'),
      ),
      body: FutureBuilder(
        future: findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading'),
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contato> contacts = snapshot.data as List<Contato>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contato contact = contacts[index];
                  return ContatoItem(contact, (id) {
                    showMyDialog(context).then((value) {
                      if (value == DialogResult.yes) {
                        delete(id);
                        setState(() {});
                        debugPrint('deletei $id');
                      }
                    });
                  });
                },
                itemCount: contacts.length,
              );
          }

          return const Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FormularioContato();
          })).then((value) {
            setState(() {});
            debugPrint('$value.toString()');
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
