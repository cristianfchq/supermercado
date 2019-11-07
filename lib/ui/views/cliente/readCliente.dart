import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:supermercado_flutter/core/models/clienteModel.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelCliente.dart';
import 'package:supermercado_flutter/ui/widgets/clienteCard.dart';
import 'package:provider/provider.dart';

class ReadCliente extends StatefulWidget {
  @override
  _ReadClienteState createState() => _ReadClienteState();
}

class _ReadClienteState extends State<ReadCliente> {
  List<Cliente> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelCliente>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addCliente');
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff2c363f),
      ),
      appBar: AppBar(
        title: Text('Clientes'),
        backgroundColor: Color(0xff2c363f),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => Cliente.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      ClienteCard(itemDetails: products[index]),
                );
              } else {
                return Text('fetching');
              }
            }),
      ),
    );
  }
}
