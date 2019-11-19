import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supermercado_flutter/core/models/inventarioModel.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelInventario.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ModifyInventario extends StatefulWidget {
  final Inventario product;

  ModifyInventario({@required this.product});

  @override
  _ModifyInventarioState createState() => _ModifyInventarioState();
}

class _ModifyInventarioState extends State<ModifyInventario> {
  final _formKey = GlobalKey<FormState>();
  var botonBodega;
  var botonProducto;

  String codigoInventario;
  String productoInventario;
  String cantidadInventario;
  String fechaElabInventario;
  String fechaExpInventario;
  String bodegaInventario;
  DateTime selectedDateElab;
  DateTime selectedDateExp;

  @override
  void initState() {
    botonProducto = widget.product.productoInventario;
    productoInventario = botonProducto;
    botonBodega = widget.product.bodegaInventario;
    bodegaInventario = botonBodega;
    selectedDateElab =
        DateFormat("dd-MM-yyyy").parse(widget.product.fechaElabInventario);
    fechaElabInventario =
        "${selectedDateElab.day}-${selectedDateElab.month}-${selectedDateElab.year}";
    selectedDateExp =
        DateFormat("dd-MM-yyyy").parse(widget.product.fechaExpInventario);
    fechaExpInventario =
        "${selectedDateExp.day}-${selectedDateExp.month}-${selectedDateExp.year}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelInventario>(context);
    Future<Null> _selectDateElab(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDateElab,
          firstDate: DateTime(1900),
          lastDate: DateTime(2050));
      if (picked != null && picked != selectedDateElab)
        setState(() {
          selectedDateElab = picked;
          var date = DateTime.parse(selectedDateElab.toString());
          var formattedDate = "${date.day}-${date.month}-${date.year}";
          fechaElabInventario = formattedDate;
        });
    }
    Future<Null> _selectDateExp(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDateExp,
          firstDate: DateTime(1900),
          lastDate: DateTime(2050));
      if (picked != null && picked != selectedDateExp)
        setState(() {
          selectedDateExp = picked;
          var date = DateTime.parse(selectedDateExp.toString());
          var formattedDate = "${date.day}-${date.month}-${date.year}";
          fechaExpInventario = formattedDate;
        });
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Modificar Inventario'),
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
                                    initialValue: widget
                                        .product.codigoInventario
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
                                    onSaved: (value) =>
                                        codigoInventario = value),
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
                                Text("Producto"),
                                StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('producto')
                                        .snapshots(),
                                    builder: (context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (!snapshot.hasData)
                                        Center(
                                          child:
                                              const CupertinoActivityIndicator(),
                                        );
                                      return DropdownButton<String>(
                                        value: botonProducto,
                                        onChanged: (newValue) {
                                          setState(() {
                                            botonProducto = newValue;
                                            productoInventario = botonProducto;
                                          });
                                        },
                                        items: snapshot.data != null
                                            ? snapshot.data.documents.map(
                                                (DocumentSnapshot document) {
                                                return new DropdownMenuItem<
                                                        String>(
                                                    value: document
                                                        .data['nombreProducto']
                                                        .toString(),
                                                    child: new Container(
                                                      //color: primaryColor,
                                                      child: new Text(
                                                        document.data[
                                                                'nombreProducto']
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
                                    initialValue: widget
                                        .product.cantidadInventario
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
                                    onSaved: (value) =>
                                        cantidadInventario = value),
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
                                Text("Fecha elaboracion"),
                                Text("${selectedDateElab.day}-${selectedDateElab.month}-${selectedDateElab.year}"),
                                SizedBox(
                                  height: 20.0,
                                ),
                                RaisedButton(
                                  onPressed: () => _selectDateElab(context),
                                  child: Text('Select date'),
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
                                Text("Fecha expiracion"),
                                Text("${selectedDateExp.day}-${selectedDateExp.month}-${selectedDateExp.year}"),
                                SizedBox(
                                  height: 20.0,
                                ),
                                RaisedButton(
                                  onPressed: () => _selectDateExp(context),
                                  child: Text('Select date'),
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
                                Text("Bodega o Perchas"),
                                StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('bodega')
                                        .snapshots(),
                                    builder: (context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (!snapshot.hasData)
                                        Center(
                                          child:
                                              const CupertinoActivityIndicator(),
                                        );
                                      return DropdownButton<String>(
                                        value: botonBodega,
                                        onChanged: (newValue) {
                                          setState(() {
                                            botonBodega = newValue;
                                            bodegaInventario = botonBodega;
                                          });
                                        },
                                        items: snapshot.data != null
                                            ? snapshot.data.documents.map(
                                                (DocumentSnapshot document) {
                                                return new DropdownMenuItem<
                                                        String>(
                                                    value: document
                                                        .data['nombreBodega']
                                                        .toString(),
                                                    child: new Container(
                                                      //color: primaryColor,
                                                      child: new Text(
                                                        document.data[
                                                                'nombreBodega']
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
                        await productProvider.updateProduct(
                            Inventario(
                              codigoInventario: int.parse(codigoInventario),
                              productoInventario: productoInventario,
                              cantidadInventario: int.parse(cantidadInventario),
                              fechaElabInventario: fechaElabInventario,
                              fechaExpInventario: fechaExpInventario,
                              bodegaInventario: bodegaInventario,
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
