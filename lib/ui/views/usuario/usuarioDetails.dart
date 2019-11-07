import 'package:flutter/material.dart';
import 'package:supermercado_flutter/core/models/usuarioModel.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelUsuario.dart';
import 'package:supermercado_flutter/ui/views/Usuario/ModifyUsuario.dart';
import 'package:provider/provider.dart';

class UsuarioDetails extends StatelessWidget {
  final Usuario product;

  UsuarioDetails({@required this.product});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelUsuario>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Usuario detalle'),
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
                      builder: (_) => ModifyUsuario(
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
                        Text(product.nombreUsuario)
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
                        Text(product.apellidoUsuario)
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
                      children: <Widget>[Text("Cedula"), Text(product.cedulaUsuario.toString())],
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
                        Text("Fecha de nacimiento"),
                        Text(product.fechaUsuario)
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
                        Text("Direccion"),
                        Text(product.direccionUsuario)
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
                        Text(product.telefonoUsuario.toString())
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
