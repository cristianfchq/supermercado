
import 'package:get_it/get_it.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelUsuario.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelProveedor.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelProducto.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelBodega.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelInventario.dart';

import './core/services/api.dart';
import './core/viewmodels/CRUDModelCliente.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => ApiCliente('cliente'));
  locator.registerLazySingleton(() => CRUDModelCliente()) ;
  locator.registerLazySingleton(() => ApiUsuario('usuario'));
  locator.registerLazySingleton(() => CRUDModelUsuario()) ;
  locator.registerLazySingleton(() => ApiProveedor('proveedor'));
  locator.registerLazySingleton(() => CRUDModelProveedor()) ;
  locator.registerLazySingleton(() => ApiProducto('producto'));
  locator.registerLazySingleton(() => CRUDModelProducto()) ;
  locator.registerLazySingleton(() => ApiBodega('bodega'));
  locator.registerLazySingleton(() => CRUDModelBodega()) ;
  locator.registerLazySingleton(() => ApiInventario('inventario'));
  locator.registerLazySingleton(() => CRUDModelInventario()) ;
}