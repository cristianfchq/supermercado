import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:supermercado_flutter/core/models/usuarioModel.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelUsuario.dart';
import 'package:supermercado_flutter/ui/widgets/usuarioCard.dart';
import 'package:provider/provider.dart';

class ReadUsuario extends StatefulWidget {
  @override
  _ReadUsuarioState createState() => _ReadUsuarioState();
}

class _ReadUsuarioState extends State<ReadUsuario> {
  List<Usuario> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelUsuario>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addUsuario');
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff2c363f),
      ),
      appBar: AppBar(
        title: Text('Usuarios'),
        backgroundColor: Color(0xff2c363f),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => Usuario.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      UsuarioCard(itemDetails: products[index]),
                );
              } else {
                return Text('fetching');
              }
            }),
      ),
    );
  }
}
