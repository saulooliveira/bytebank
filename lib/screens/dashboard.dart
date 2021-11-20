import 'package:bytebank/components/dashboard_button.dart';
import 'package:bytebank/htpp/http.dart';
import 'package:bytebank/screens/lista_contatos.dart';
import 'package:bytebank/screens/lista_transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/bytebank_logo.png'),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DashboardButton(
                  'Contatos',
                  Icons.people,
                  onClick: () => showContatos(context),
                ),
                DashboardButton(
                  'Lista de Transfer',
                  Icons.share_sharp,
                  onClick: () => showListaTransferencias(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showContatos(BuildContext context) {
    findAll();
    Navigator.of(context).push((MaterialPageRoute(
      builder: (context) => const ListaContatos(),
    )));
  }

  showListaTransferencias(BuildContext context) {
    Navigator.of(context).push((MaterialPageRoute(
      builder: (context) => ListaTransferencias(),
    )));
  }
}
