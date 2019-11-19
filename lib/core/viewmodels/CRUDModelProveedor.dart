import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/proveedorModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelProveedor extends ChangeNotifier {
  ApiProveedor _api = locator<ApiProveedor>();

  List<Proveedor> products;


  Future<List<Proveedor>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Proveedor.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Proveedor> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Proveedor.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Proveedor data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Proveedor data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}
