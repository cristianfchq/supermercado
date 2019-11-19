import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:supermercado_flutter/core/models/ventasModel.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelVentas.dart';
import 'package:supermercado_flutter/ui/widgets/ventasCard.dart';
import 'package:provider/provider.dart';

class ReadVentas extends StatefulWidget {
  @override
  _ReadVentasState createState() => _ReadVentasState();
}

class _ReadVentasState extends State<ReadVentas> {
  List<Ventas> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelVentas>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addVentas');
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff2c363f),
      ),
      appBar: AppBar(
        title: Text('Ventas'),
        backgroundColor: Color(0xff2c363f),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.picture_as_pdf,color: Colors.white,),
//            onPressed: () => _generatePdfAndView(context),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => Ventas.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      VentasCard(itemDetails: products[index]),
                );
              } else {
                return Text('Cargando');
              }
            }),
      ),
    );
  }
}
