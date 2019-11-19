import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supermercado_flutter/core/models/ventasModel.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelVentas.dart';

class ModifyVentas extends StatefulWidget {
  final Ventas product;

  ModifyVentas({@required this.product});

  @override
  _ModifyVentasState createState() => _ModifyVentasState();
}

class _ModifyVentasState extends State<ModifyVentas> {
  final _formKey = GlobalKey<FormState>();
  var category;

  String codigo;
  String codProducto;
  String producto;
  String cantidad;
  String precioUnitario;
  String subTotal;
  String total;
  String fecha;

//  @override
//  void initState() {
//    category = widget.product.proveedorProducto;
//    proveedorProducto = category;
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelVentas>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Modificar Vents'),
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
                                Text("Codigo Venta"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    initialValue: widget.product.codigo,
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
                                    onSaved: (value) => codigo = value),
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
                                    initialValue: widget.product.codProducto,
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
                                    onSaved: (value) => codProducto = value),
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
                                Text("Nombre Producto"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    initialValue: widget.product.producto,
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
                                    onSaved: (value) => producto = value),
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
                                    initialValue:
                                        widget.product.cantidad.toString(),
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
                                    onSaved: (value) => cantidad = value),
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
                                Text("Precio Unitario"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    initialValue: widget.product.precioUnitario
                                        .toString(),
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
                                    onSaved: (value) => precioUnitario = value),
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
                                Text("Sub Total"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    initialValue:
                                        widget.product.subTotal.toString(),
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
                                    onSaved: (value) => subTotal = value),
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
                                Text("Total"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    initialValue:
                                        widget.product.total.toString(),
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
                                    onSaved: (value) => total = value),
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
                                Text("Fecha"),
                                TextFormField(
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    initialValue: widget.product.fecha,
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
                                    onSaved: (value) => fecha = value),
                              ],
                            ),
                          )),
                    ],
                  ),
//                  Row(
//                    children: <Widget>[
//                      Expanded(
//                          flex: 1,
//                          child: Padding(
//                            padding: EdgeInsets.all(10),
//                            child: Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Text("Proveedor"),
//                                StreamBuilder(
//                                    stream: Firestore.instance.collection('proveedor').snapshots(),
//                                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                                      if (!snapshot.hasData)
//                                        Center(
//                                          child: const CupertinoActivityIndicator(),
//                                        );
//                                      return DropdownButton<String>(
//                                        value: category,
//                                        onChanged: (newValue) {
//                                          setState(() {
//                                            category = newValue;
//                                            proveedorProducto = category;
//                                          });
//                                        },
//                                        items: snapshot.data != null
//                                            ? snapshot.data.documents
//                                                .map((DocumentSnapshot document) {
//                                                return new DropdownMenuItem<String>(
//                                                    value: document.data['nombreProveedor'].toString(),
//                                                    child: new Container(
//                                                      //color: primaryColor,
//                                                      child: new Text(
//                                                        document.data['nombreProveedor'].toString(),
//                                                      ),
//                                                    ));
//                                              }).toList()
//                                            : DropdownMenuItem(
//                                                value: 'null',
//                                                child: new Container(
//                                                  height: 100.0,
//                                                  child: new Text('null'),
//                                                ),
//                                              ),
//                                      );
//                                    }),
//                              ],
//                            ),
//                          )),
//                    ],
//                  ),
                  RaisedButton(
                    splashColor: Colors.red,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        await productProvider.updateProduct(
                            Ventas(
                              codigo: codigo,
                              codProducto: codProducto,
                              producto: producto,
                              cantidad: int.parse(cantidad),
                              precioUnitario: int.parse(precioUnitario),
                              subTotal: int.parse(subTotal),
                              total: int.parse(total),
                              fecha: fecha,
                            ),
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
