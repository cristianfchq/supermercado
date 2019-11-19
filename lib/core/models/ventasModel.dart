
class Ventas {
  String id;
  String codigo;
  String codProducto;
  String producto;
  int cantidad;
  int precioUnitario;
  int subTotal;
  int total;
  String fecha;

  Ventas({this.id, this.codigo, this.codProducto,this.producto,this.cantidad,this.precioUnitario,this.subTotal, this.total, this.fecha});

  Ventas.fromMap(Map snapshot,String id) :
        id = id ?? '',
        codigo = snapshot['codigo'] ?? '',
        codProducto = snapshot['codProducto'] ?? '',
        producto = snapshot['producto'] ?? '',
        cantidad = snapshot['cantidad'] ?? '',
        precioUnitario = snapshot['precioUnitario'] ?? '',
        subTotal = snapshot['subTotal'] ?? '',
        total = snapshot['total'] ?? '',
        fecha = snapshot['fecha'] ?? '';

  toJson() {
    return {
      "codigo": codigo,
      "codProducto": codProducto,
      "producto": producto,
      "cantidad": cantidad,
      "precioUnitario": precioUnitario,
      "subTotal": subTotal,
      "total": total,
      "fecha": fecha,
    };
  }
}