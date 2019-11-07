import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/clienteModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelCliente extends ChangeNotifier {
  ApiCliente _api = locator<ApiCliente>();

  List<Cliente> products;


  Future<List<Cliente>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Cliente.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Cliente> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Cliente.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Cliente data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Cliente data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}
