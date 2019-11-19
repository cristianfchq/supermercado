import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:supermercado_flutter/core/models/productoModel.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelProducto.dart';
import 'package:supermercado_flutter/ui/widgets/productoCard.dart';
import 'package:provider/provider.dart';

class ReadProducto extends StatefulWidget {
  @override
  _ReadProductoState createState() => _ReadProductoState();
}

class _ReadProductoState extends State<ReadProducto> {
  List<Producto> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelProducto>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addProducto');
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff2c363f),
      ),
      appBar: AppBar(
        title: Text('Productos'),
        backgroundColor: Color(0xff2c363f),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => Producto.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      ProductoCard(itemDetails: products[index]),
                );
              } else {
                return Text('fetching');
              }
            }),
      ),
    );
  }
}
