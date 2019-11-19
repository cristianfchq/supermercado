import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import 'package:supermercado_flutter/core/models/ventasModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import '../models/ventasModel.dart';
class CRUDModelVentas extends ChangeNotifier {
  ApiVentas _api = locator<ApiVentas>();

  List<Ventas> products;


  Future<List<Ventas>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Ventas.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Ventas> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Ventas.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Ventas data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Ventas data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}
