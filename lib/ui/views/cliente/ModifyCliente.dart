import 'package:flutter/material.dart';
import 'package:supermercado_flutter/core/models/clienteModel.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelCliente.dart';
import 'package:provider/provider.dart';

class ModifyCliente extends StatefulWidget {
  final Cliente product;

  ModifyCliente({@required this.product});

  @override
  _ModifyClienteState createState() => _ModifyClienteState();
}

class _ModifyClienteState extends State<ModifyCliente> {
  final _formKey = GlobalKey<FormState>();

  String nombreCliente;
  String apellidoCliente;
  String cedula;
  String direccion;
  String telefono;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelCliente>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Modificar cliente'),
          backgroundColor: Color(0xff2c363f),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              child: Column(
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
                                TextFormField(
                                    initialValue: widget.product.nombreCliente,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'El campo debe estar llenado';
                                      }
                                    },
                                    onSaved: (value) => nombreCliente = value),
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
                                TextFormField(
                                    initialValue:
                                        widget.product.apellidoCliente,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'El campo debe estar llenado';
                                      }
                                    },
                                    onSaved: (value) =>
                                        apellidoCliente = value),
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
                                Text("Cedula"),
                                TextFormField(
                                    initialValue: widget.product.cedula,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'El campo debe estar llenado';
                                      }
                                    },
                                    onSaved: (value) => cedula = value),
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
                                TextFormField(
                                    initialValue: widget.product.direccion,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'El campo debe estar llenado';
                                      }
                                    },
                                    onSaved: (value) => direccion = value),
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
                                TextFormField(
                                    initialValue:
                                        widget.product.telefono.toString(),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'El campo debe estar llenado';
                                      }
                                    },
                                    onSaved: (value) => telefono = value),
                              ],
                            ),
                          )),
                    ],
                  ),
                  RaisedButton(
                    splashColor: Colors.red,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        await productProvider.updateProduct(
                            Cliente(
                                nombreCliente: nombreCliente,
                                apellidoCliente: apellidoCliente,
                                cedula: cedula,
                                direccion: direccion,
                                telefono: int.parse(telefono)),
                            widget.product.id);
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Modificar',
                        style: TextStyle(color: Colors.white)),
                    color: Color(0xff2c363f),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
