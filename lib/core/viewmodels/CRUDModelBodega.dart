import 'dart:async';
import 'package:flutter/material.dart';
import '../../locator.dart';
import '../services/api.dart';
import '../models/bodegaModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModelBodega extends ChangeNotifier {
  ApiBodega _api = locator<ApiBodega>();

  List<Bodega> products;


  Future<List<Bodega>> fetchProducts() async {
    var result = await _api.getDataCollection();
    products = result.documents
        .map((doc) => Bodega.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Bodega> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Bodega.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
     await _api.removeDocument(id) ;
     return ;
  }
  Future updateProduct(Bodega data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Bodega data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}
