import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:supermercado_flutter/core/models/inventarioModel.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelInventario.dart';
import 'package:supermercado_flutter/ui/widgets/inventarioCard.dart';
import 'package:provider/provider.dart';

class ReadInventario extends StatefulWidget {
  @override
  _ReadInventarioState createState() => _ReadInventarioState();
}

class _ReadInventarioState extends State<ReadInventario> {
  List<Inventario> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelInventario>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addInventario');
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff2c363f),
      ),
      appBar: AppBar(
        title: Text('Inventario'),
        backgroundColor: Color(0xff2c363f),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => Inventario.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      InventarioCard(itemDetails: products[index]),
                );
              } else {
                return Text('fetching');
              }
            }),
      ),
    );
  }
}
