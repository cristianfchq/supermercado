import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supermercado_flutter/ui/views/bodega/addBodega.dart';
import 'package:supermercado_flutter/ui/views/bodega/bodegaDetails.dart';
import 'package:supermercado_flutter/ui/views/bodega/readBodega.dart';
import 'package:supermercado_flutter/ui/views/cliente/addCliente.dart';
import 'package:supermercado_flutter/ui/views/cliente/clienteDetails.dart';
import 'package:supermercado_flutter/ui/views/cliente/readCliente.dart';
import 'package:supermercado_flutter/ui/views/homeView.dart';
import 'package:supermercado_flutter/ui/views/inventario/addInventario.dart';
import 'package:supermercado_flutter/ui/views/inventario/inventarioDetails.dart';
import 'package:supermercado_flutter/ui/views/inventario/readInventario.dart';
import 'package:supermercado_flutter/ui/views/producto/addProducto.dart';
import 'package:supermercado_flutter/ui/views/producto/productoDetails.dart';
import 'package:supermercado_flutter/ui/views/producto/readProducto.dart';
import 'package:supermercado_flutter/ui/views/proveedor/addProveedor.dart';
import 'package:supermercado_flutter/ui/views/proveedor/proveedorDetails.dart';
import 'package:supermercado_flutter/ui/views/proveedor/readProveedor.dart';
import 'package:supermercado_flutter/ui/views/usuario/addUsuario.dart';
import 'package:supermercado_flutter/ui/views/usuario/usuarioDetails.dart';
import 'package:supermercado_flutter/ui/views/usuario/readUsuario.dart';
import 'package:supermercado_flutter/ui/views/ventas/addVentas.dart';
import 'package:supermercado_flutter/ui/views/ventas/readVentas.dart';
import 'package:supermercado_flutter/ui/views/ventas/ventasDetails.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
          builder: (_)=> HomeView()
        );
      case '/readCliente' :
        return  MaterialPageRoute(
          builder: (_)=> ReadCliente()
        );
      case '/addCliente' :
        return MaterialPageRoute(
          builder: (_)=> AddCliente()
        ) ;
      case '/clienteDetails' :
        return MaterialPageRoute(
            builder: (_)=> ClienteDetails()
        ) ;
      case '/readUsuario' :
        return  MaterialPageRoute(
          builder: (_)=> ReadUsuario()
        );
      case '/addUsuario' :
        return MaterialPageRoute(
          builder: (_)=> AddUsuario()
        ) ;
      case '/usuarioDetails' :
        return MaterialPageRoute(
            builder: (_)=> UsuarioDetails()
        ) ;
      case '/readProveedor' :
        return  MaterialPageRoute(
          builder: (_)=> ReadProveedor()
        );
      case '/addProveedor' :
        return MaterialPageRoute(
          builder: (_)=> AddProveedor()
        ) ;
      case '/proveedorDetails' :
        return MaterialPageRoute(
            builder: (_)=> ProveedorDetails()
        ) ;
      case '/readProducto' :
        return  MaterialPageRoute(
          builder: (_)=> ReadProducto()
        );
      case '/addProducto' :
        return MaterialPageRoute(
          builder: (_)=> AddProducto()
        ) ;
      case '/productoDetails' :
        return MaterialPageRoute(
            builder: (_)=> ProductoDetails()
        ) ;
      case '/readBodega' :
        return  MaterialPageRoute(
          builder: (_)=> ReadBodega()
        );
      case '/addBodega' :
        return MaterialPageRoute(
          builder: (_)=> AddBodega()
        ) ;
      case '/bodegaDetails' :
        return MaterialPageRoute(
            builder: (_)=> BodegaDetails()
        ) ;
      case '/readInventario' :
        return  MaterialPageRoute(
          builder: (_)=> ReadInventario()
        );
      case '/addInventario' :
        return MaterialPageRoute(
          builder: (_)=> AddInventario()
        ) ;
      case '/inventarioDetails' :
        return MaterialPageRoute(
            builder: (_)=> InventarioDetails()
        ) ;
      case '/readVentas' :
        return  MaterialPageRoute(
            builder: (_)=> ReadVentas()
        );
      case '/addVentas' :
        return MaterialPageRoute(
            builder: (_)=> AddVentas()
        ) ;
      case '/ventasDetails' :
        return MaterialPageRoute(
            builder: (_)=> VentasDetails()
        ) ;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}