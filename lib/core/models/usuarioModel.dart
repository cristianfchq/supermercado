
class Usuario {
  String id;
  String nombreUsuario;
  String apellidoUsuario;
  int cedulaUsuario;
  String fechaUsuario;
  String direccionUsuario;
  int telefonoUsuario;
  String password;

  Usuario({this.id, this.nombreUsuario, this.apellidoUsuario,this.cedulaUsuario,this.fechaUsuario,this.direccionUsuario,this.telefonoUsuario,this.password});

  Usuario.fromMap(Map snapshot,String id) :
        id = id ?? '',
        nombreUsuario = snapshot['nombreUsuario'] ?? '',
        apellidoUsuario = snapshot['apellidoUsuario'] ?? '',
        cedulaUsuario = snapshot['cedulaUsuario'] ?? '',
        fechaUsuario = snapshot['fechaUsuario'] ?? '',
        direccionUsuario = snapshot['direccionUsuario'] ?? '',
        telefonoUsuario = snapshot['telefonoUsuario'] ?? '',
        password = snapshot['password'] ?? '';

  toJson() {
    return {
      "nombreUsuario": nombreUsuario,
      "apellidoUsuario": apellidoUsuario,
      "cedulaUsuario": cedulaUsuario,
      "fechaUsuario": fechaUsuario,
      "direccionUsuario": direccionUsuario,
      "telefonoUsuario": telefonoUsuario,
      "password": password,
    };
  }
}