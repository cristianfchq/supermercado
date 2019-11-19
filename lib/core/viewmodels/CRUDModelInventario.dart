import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/inventarioModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelInventario extends ChangeNotifier {
  ApiInventario _api = locator<ApiInventario>();

  List<Inventario> products;


  Future<List<Inventario>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Inventario.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Inventario> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Inventario.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Inventario data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Inventario data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}
