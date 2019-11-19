
class Proveedor {
  String id;
  String nombreProveedor;
  int rucProveedor;
  String direccionProveedor;
  String nomContactoProveedor;
  int telefonoProveedor;

  Proveedor({this.id, this.nombreProveedor, this.rucProveedor,this.direccionProveedor,this.nomContactoProveedor,this.telefonoProveedor});

  Proveedor.fromMap(Map snapshot,String id) :
        id = id ?? '',
        nombreProveedor = snapshot['nombreProveedor'] ?? '',
        rucProveedor = snapshot['rucProveedor'] ?? '',
        direccionProveedor = snapshot['direccionProveedor'] ?? '',
        nomContactoProveedor = snapshot['nomContactoProveedor'] ?? '',
        telefonoProveedor = snapshot['telefonoProveedor'] ?? '';

  toJson() {
    return {
      "nombreProveedor": nombreProveedor,
      "rucProveedor": rucProveedor,
      "direccionProveedor": direccionProveedor,
      "nomContactoProveedor": nomContactoProveedor,
      "telefonoProveedor": telefonoProveedor,
    };
  }
}