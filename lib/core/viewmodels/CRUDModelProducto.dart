import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/productoModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelProducto extends ChangeNotifier {
  ApiProducto _api = locator<ApiProducto>();

  List<Producto> products;


  Future<List<Producto>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Producto.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Producto> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Producto.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Producto data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Producto data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}
