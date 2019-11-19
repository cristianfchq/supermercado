import 'package:flutter/material.dart';
import 'package:supermercado_flutter/ui/views/bodega/readBodega.dart';
import 'package:supermercado_flutter/ui/views/cliente/readCliente.dart';
import 'package:supermercado_flutter/ui/views/inventario/readInventario.dart';
import 'package:supermercado_flutter/ui/views/producto/readProducto.dart';
import 'package:supermercado_flutter/ui/views/proveedor/readProveedor.dart';
import 'package:supermercado_flutter/ui/views/usuario/readUsuario.dart';

class PageMenu extends StatefulWidget {
  @override
  _PageMenuState createState() => new _PageMenuState();
}

class _PageMenuState extends State<PageMenu> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Menu principal'),
        backgroundColor: Color(0xff2c363f),
      ),
      drawer: new Drawer(
          child: new ListView(
        children: <Widget>[
          new ListTile(
            title: new Text('Supermercado', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),),
            onTap: () {},
          ),
          Divider(),
          new ListTile(
            title: new Text('Usuario'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ReadUsuario()));
            },
          ),
          new ListTile(
            title: new Text('Cliente'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ReadCliente()));
            },
          ),
          new ListTile(
            title: new Text('Producto'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ReadProducto()));
            },
          ),
          new ListTile(
            title: new Text('Proveedor'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ReadProveedor()));
            },
          ),
          new ListTile(
            title: new Text('Inventario'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ReadInventario()));
            },
          ),
          new ListTile(
            title: new Text('Bodegas'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ReadBodega()));
            },
          ),
        ],
      )),
      body: new Center(
        child: new Text(
          'Bienvenido',
        ),
      ),
    );
  }
}
