import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supermercado_flutter/core/models/usuarioModel.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelUsuario.dart';
import 'package:provider/provider.dart';

class ModifyUsuario extends StatefulWidget {
  final Usuario product;

  ModifyUsuario({@required this.product});

  @override
  _ModifyUsuarioState createState() => _ModifyUsuarioState();
}

class _ModifyUsuarioState extends State<ModifyUsuario> {

  final _formKey = GlobalKey<FormState>();

  String nombreUsuario;
  String apellidoUsuario;
  String cedulaUsuario;
  String fechaUsuario;
  String direccionUsuario;
  String telefonoUsuario;
  String password;
  DateTime selectedDate;

  @override
    void initState() {
      selectedDate = DateFormat("dd-MM-yyyy").parse(widget.product.fechaUsuario);
      fechaUsuario = "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
      super.initState();
    }

  @override
  Widget build(BuildContext context) {

      Future<Null> _selectDate(BuildContext context) async {
        final DateTime picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(1900),
            lastDate: DateTime.now());
        if (picked != null && picked != selectedDate)
          setState(() {
            selectedDate = picked;
            var date = DateTime.parse(selectedDate.toString());
            var formattedDate = "${date.day}-${date.month}-${date.year}";
            fechaUsuario = formattedDate;
          });
      }

    final productProvider = Provider.of<CRUDModelUsuario>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Modificar Usuario'),
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
                                    initialValue: widget.product.nombreUsuario,
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
                                    onSaved: (value) => nombreUsuario = value),
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
                                        widget.product.apellidoUsuario,
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
                                        apellidoUsuario = value),
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
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    initialValue: widget.product.cedulaUsuario.toString(),
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
                                    onSaved: (value) => cedulaUsuario = value),
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
                                Text("${selectedDate.day}-${selectedDate.month}-${selectedDate.year}"),
                                SizedBox(
                                  height: 20.0,
                                ),
                                RaisedButton(
                                  onPressed: () => _selectDate(context),
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
                                Text("Direccion"),
                                TextFormField(
                                    initialValue:
                                        widget.product.direccionUsuario.toString(),
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
                                    onSaved: (value) => direccionUsuario = value),
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
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    initialValue:
                                        widget.product.telefonoUsuario.toString(),
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
                                    onSaved: (value) => telefonoUsuario = value),
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
                            Usuario(
                            nombreUsuario: nombreUsuario,
                            apellidoUsuario: apellidoUsuario,
                            cedulaUsuario: int.parse(cedulaUsuario),
                            fechaUsuario: fechaUsuario,
                            direccionUsuario: direccionUsuario,
                            telefonoUsuario: int.parse(telefonoUsuario),
                            password: password),
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
