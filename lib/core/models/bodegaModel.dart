
class Bodega {
  String id;
  String nombreBodega;
  String ubicacionBodega;
  String descripcionBodega;

  Bodega({this.id, this.nombreBodega, this.ubicacionBodega,this.descripcionBodega});

  Bodega.fromMap(Map snapshot,String id) :
        id = id ?? '',
        nombreBodega = snapshot['nombreBodega'] ?? '',
        ubicacionBodega = snapshot['ubicacionBodega'] ?? '',
        descripcionBodega = snapshot['descripcionBodega'] ?? '';

  toJson() {
    return {
      "nombreBodega": nombreBodega,
      "ubicacionBodega": ubicacionBodega,
      "descripcionBodega": descripcionBodega,
    };
  }
}