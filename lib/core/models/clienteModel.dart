
class Cliente {
  String id;
  String nombreCliente;
  String apellidoCliente;
  String cedula;
  String direccion;
  int telefono;

  Cliente({this.id, this.nombreCliente, this.apellidoCliente,this.cedula,this.direccion,this.telefono});

  Cliente.fromMap(Map snapshot,String id) :
        id = id ?? '',
        nombreCliente = snapshot['nombreCliente'] ?? '',
        apellidoCliente = snapshot['apellidoCliente'] ?? '',
        cedula = snapshot['cedula'] ?? '',
        direccion = snapshot['direccion'] ?? '',
        telefono = snapshot['telefono'] ?? '';

  toJson() {
    return {
      "nombreCliente": nombreCliente,
      "apellidoCliente": apellidoCliente,
      "cedula": cedula,
      "direccion": direccion,
      "telefono": telefono,
    };
  }
}