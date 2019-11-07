import 'package:flutter/material.dart';
import 'package:supermercado_flutter/core/models/clienteModel.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelCliente.dart';
import 'package:supermercado_flutter/ui/views/cliente/ModifyCliente.dart';
import 'package:provider/provider.dart';

class ClienteDetails extends StatelessWidget {
  final Cliente product;

  ClienteDetails({@required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelCliente>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cliente detalle'),
        backgroundColor: Color(0xff2c363f),
        actions: <Widget>[
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.delete_forever),
            onPressed: () async {
              await productProvider.removeProduct(product.id);
              Navigator.pop(context);
            },
          ),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ModifyCliente(
                            product: product,
                          )));
            },
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Nombre"),
                        Text(product.nombreCliente)
                      ],
                    ),
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Apellido"),
                        Text(product.apellidoCliente)
                      ],
                    ),
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[Text("Cedula"), Text(product.cedula)],
                    ),
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Direccion"),
                        Text(product.direccion)
                      ],
                    ),
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Telefono"),
                        Text(product.telefono.toString())
                      ],
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
