import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/router.dart';
import './locator.dart';
import './core/viewmodels/CRUDModelCliente.dart';
import './core/viewmodels/CRUDModelUsuario.dart';
import './core/viewmodels/CRUDModelProveedor.dart';
import './core/viewmodels/CRUDModelProducto.dart';
import './core/viewmodels/CRUDModelBodega.dart';
import './core/viewmodels/CRUDModelInventario.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => locator<CRUDModelCliente>()),
        ChangeNotifierProvider(builder: (_) => locator<CRUDModelUsuario>()),
        ChangeNotifierProvider(builder: (_) => locator<CRUDModelProveedor>()),
        ChangeNotifierProvider(builder: (_) => locator<CRUDModelProducto>()),
        ChangeNotifierProvider(builder: (_) => locator<CRUDModelBodega>()),
        ChangeNotifierProvider(builder: (_) => locator<CRUDModelInventario>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        title: 'Supermercado',
        theme: ThemeData(),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

