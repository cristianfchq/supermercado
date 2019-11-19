import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:supermercado_flutter/core/models/proveedorModel.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelProveedor.dart';
import 'package:supermercado_flutter/ui/widgets/proveedorCard.dart';
import 'package:provider/provider.dart';

class ReadProveedor extends StatefulWidget {
  @override
  _ReadProveedorState createState() => _ReadProveedorState();
}

class _ReadProveedorState extends State<ReadProveedor> {
  List<Proveedor> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelProveedor>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addProveedor');
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff2c363f),
      ),
      appBar: AppBar(
        title: Text('Proveedores'),
        backgroundColor: Color(0xff2c363f),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => Proveedor.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      ProveedorCard(itemDetails: products[index]),
                );
              } else {
                return Text('fetching');
              }
            }),
      ),
    );
  }
}
