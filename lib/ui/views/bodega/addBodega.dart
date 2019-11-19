import 'package:flutter/material.dart';
import 'package:supermercado_flutter/core/models/bodegaModel.dart';
import 'package:provider/provider.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelBodega.dart';

class AddBodega extends StatefulWidget {
  @override
  _AddBodegaState createState() => _AddBodegaState();
}

class _AddBodegaState extends State<AddBodega> {
  final _formKey = GlobalKey<FormState>();

  String nombreBodega;
  String ubicacionBodega;
  String descripcionBodega;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<CRUDModelBodega>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Añadir Cliente'),
          backgroundColor: Color(0xff2c363f),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(8),
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
                                    onSaved: (value) => nombreBodega = value),
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
                                Text("Ubicacion"),
                                TextFormField(
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
                                        ubicacionBodega = value),
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
                                Text("Descripcion"),
                                TextFormField(
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
                                    onSaved: (value) => descripcionBodega = value),
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
                        await productProvider.addProduct(Bodega(
                            nombreBodega: nombreBodega,
                            ubicacionBodega: ubicacionBodega,
                            descripcionBodega: descripcionBodega));
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Registrar',
                        style: TextStyle(color: Colors.white)),
                    color: Color(0xff2c363f),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
