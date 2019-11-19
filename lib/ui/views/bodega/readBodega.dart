import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:supermercado_flutter/core/models/bodegaModel.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelBodega.dart';
import 'package:supermercado_flutter/ui/widgets/bodegaCard.dart';
import 'package:provider/provider.dart';

class ReadBodega extends StatefulWidget {
  @override
  _ReadBodegaState createState() => _ReadBodegaState();
}

class _ReadBodegaState extends State<ReadBodega> {
  List<Bodega> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelBodega>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addBodega');
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff2c363f),
      ),
      appBar: AppBar(
        title: Text('Bodegas'),
        backgroundColor: Color(0xff2c363f),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => Bodega.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      BodegaCard(itemDetails: products[index]),
                );
              } else {
                return Text('fetching');
              }
            }),
      ),
    );
  }
}
