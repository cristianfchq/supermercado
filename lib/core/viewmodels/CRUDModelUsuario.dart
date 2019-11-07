import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/usuarioModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelUsuario extends ChangeNotifier {
  ApiUsuario _api = locator<ApiUsuario>();

  List<Usuario> products;


  Future<List<Usuario>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Usuario.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Usuario> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Usuario.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Usuario data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Usuario data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}
