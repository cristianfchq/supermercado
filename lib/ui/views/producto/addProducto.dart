import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supermercado_flutter/core/models/productoModel.dart';
import 'package:provider/provider.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelProducto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class AddProducto extends StatefulWidget {
  @override
  _AddProductoState createState() => _AddProductoState();
}

class _AddProductoState extends State<AddProducto> {
  final _formKey = GlobalKey<FormState>();
  String _counter, _value = "0000";
  Future _incrementCounter() async {
    _counter = await FlutterBarcodeScanner.scanBarcode(
        "#004297", "Cancel", true, ScanMode.BARCODE);
    setState(() {
      _value = _counter;
      codigoProducto = _value;
    });
  }

  var botonProducto;
  String codigoProducto;
  String nombreProducto;
  String cantidadProducto;
  String preCostoProducto;
  String preVentaProducto;
  String stockMinProducto;
  String stockMaxProducto;
  String impuestoProducto;
  String proveedorProducto;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<CRUDModelProducto>(context);
    codigoProducto = _value;
    return Scaffold(
        appBar: AppBar(
          title: Text('Añadir Producto'),
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
                                Text("Codigo - Presione el boton para escanear"),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Text(_value),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: RaisedButton(
                                        onPressed: _incrementCounter,
                                        child: Text(
                                          "Leer QR",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
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
                                    onSaved: (value) => nombreProducto = value),
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
                                Text("Cantidad"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
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
                                        cantidadProducto = value),
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
                                Text("Precio de costo"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
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
                                        preCostoProducto = value),
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
                                Text("Precio de venta"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
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
                                        preVentaProducto = value),
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
                                Text("Stock minimo"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
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
                                        stockMinProducto = value),
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
                                Text("Stock maximo"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
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
                                        stockMaxProducto = value),
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
                                Text("Impuesto"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
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
                                        impuestoProducto = value),
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
                                Text("Proveedor"),
                                StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('proveedor')
                                        .snapshots(),
                                    builder: (context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (!snapshot.hasData)
                                        Center(
                                          child:
                                              const CupertinoActivityIndicator(),
                                        );
                                      return DropdownButtonFormField<String>(
                                        value: botonProducto,
                                        hint: Text('Proveedor'),
                                        onChanged: (newValue) {
                                          setState(() {
                                            botonProducto = newValue;
                                            proveedorProducto = botonProducto;
                                          });
                                        },
                                        validator: (String botonProducto) {
                                          if (botonProducto?.isEmpty ?? true) {
                                            return 'Seleccione el proveedor';
                                          }
                                        },
                                        items: snapshot.data != null
                                            ? snapshot.data.documents.map(
                                                (DocumentSnapshot document) {
                                                return new DropdownMenuItem<
                                                        String>(
                                                    value: document
                                                        .data['nombreProveedor']
                                                        .toString(),
                                                    child: new Container(
                                                      //color: primaryColor,
                                                      child: new Text(
                                                        document.data[
                                                                'nombreProveedor']
                                                            .toString(),
                                                      ),
                                                    ));
                                              }).toList()
                                            : DropdownMenuItem(
                                                value: 'null',
                                                child: new Container(
                                                  height: 100.0,
                                                  child: new Text('null'),
                                                ),
                                              ),
                                      );
                                    }),
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
                        await productProvider.addProduct(Producto(
                            codigoProducto: int.parse(codigoProducto),
                            nombreProducto: nombreProducto,
                            cantidadProducto: int.parse(cantidadProducto),
                            preCostoProducto: int.parse(preCostoProducto),
                            preVentaProducto: int.parse(preVentaProducto),
                            stockMinProducto: int.parse(stockMinProducto),
                            stockMaxProducto: int.parse(stockMaxProducto),
                            impuestoProducto: int.parse(impuestoProducto),
                            proveedorProducto: proveedorProducto));
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
