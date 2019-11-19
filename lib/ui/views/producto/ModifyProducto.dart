import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supermercado_flutter/core/models/productoModel.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelProducto.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ModifyProducto extends StatefulWidget {
  final Producto product;

  ModifyProducto({@required this.product});

  @override
  _ModifyProductoState createState() => _ModifyProductoState();
}

class _ModifyProductoState extends State<ModifyProducto> {
  final _formKey = GlobalKey<FormState>();
  var category;
  
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
  void initState() {
    category = widget.product.proveedorProducto;
    proveedorProducto = category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelProducto>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Modificar Producto'),
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
                                Text("Codigo"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    initialValue: widget.product.codigoProducto.toString(),
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
                                    onSaved: (value) => codigoProducto = value),
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
                                Text("Nombres"),
                                TextFormField(
                                    initialValue:
                                        widget.product.nombreProducto,
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
                                        nombreProducto = value),
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
                                    initialValue: widget.product.cantidadProducto.toString(),
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
                                    onSaved: (value) => cantidadProducto = value),
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
                                    initialValue: widget.product.preCostoProducto.toString(),
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
                                    onSaved: (value) => preCostoProducto = value),
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
                                    initialValue:
                                        widget.product.preVentaProducto.toString(),
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
                                    onSaved: (value) => preVentaProducto = value),
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
                                    initialValue:
                                        widget.product.stockMinProducto.toString(),
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
                                    onSaved: (value) => stockMinProducto = value),
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
                                    initialValue:
                                        widget.product.stockMaxProducto.toString(),
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
                                    onSaved: (value) => stockMaxProducto = value),
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
                                    initialValue:
                                        widget.product.impuestoProducto.toString(),
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
                                    onSaved: (value) => impuestoProducto = value),
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
                                    stream: Firestore.instance.collection('proveedor').snapshots(),
                                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (!snapshot.hasData)
                                        Center(
                                          child: const CupertinoActivityIndicator(),
                                        );
                                      return DropdownButton<String>(
                                        value: category,
                                        onChanged: (newValue) {
                                          setState(() {
                                            category = newValue;
                                            proveedorProducto = category;
                                          });
                                        },
                                        items: snapshot.data != null
                                            ? snapshot.data.documents
                                                .map((DocumentSnapshot document) {
                                                return new DropdownMenuItem<String>(
                                                    value: document.data['nombreProveedor'].toString(),
                                                    child: new Container(
                                                      //color: primaryColor,
                                                      child: new Text(
                                                        document.data['nombreProveedor'].toString(),
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
                        await productProvider.updateProduct(
                            Producto(
                                codigoProducto: int.parse(codigoProducto),
                                nombreProducto: nombreProducto,
                                cantidadProducto: int.parse(cantidadProducto),
                                preCostoProducto: int.parse(preCostoProducto),
                                preVentaProducto: int.parse(preVentaProducto),
                                stockMinProducto: int.parse(stockMinProducto),
                                stockMaxProducto: int.parse(stockMaxProducto),
                                impuestoProducto: int.parse(impuestoProducto),
                                proveedorProducto: proveedorProducto),
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
