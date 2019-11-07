import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supermercado_flutter/ui/views/cliente/addCliente.dart';
import 'package:supermercado_flutter/ui/views/cliente/clienteDetails.dart';
import 'package:supermercado_flutter/ui/views/cliente/readCliente.dart';
import 'package:supermercado_flutter/ui/views/homeView.dart';

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