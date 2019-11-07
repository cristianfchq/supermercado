
import 'package:get_it/get_it.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelUsuario.dart';

import './core/services/api.dart';
import './core/viewmodels/CRUDModelCliente.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => ApiCliente('cliente'));
  locator.registerLazySingleton(() => CRUDModelCliente()) ;
  locator.registerLazySingleton(() => ApiUsuario('usuario'));
  locator.registerLazySingleton(() => CRUDModelUsuario()) ;
}