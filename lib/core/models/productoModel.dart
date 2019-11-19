
class Producto {
  String id;
  int codigoProducto;
  String nombreProducto;
  int cantidadProducto;
  int preCostoProducto;
  int preVentaProducto;
  int stockMinProducto;
  int stockMaxProducto;
  int impuestoProducto;
  String proveedorProducto;

  Producto({this.id, this.codigoProducto, this.nombreProducto,this.cantidadProducto,this.preCostoProducto,this.preVentaProducto,this.stockMinProducto, this.stockMaxProducto,this.impuestoProducto,this.proveedorProducto});

  Producto.fromMap(Map snapshot,String id) :
        id = id ?? '',
        codigoProducto = snapshot['codigoProducto'] ?? '',
        nombreProducto = snapshot['nombreProducto'] ?? '',
        cantidadProducto = snapshot['cantidadProducto'] ?? '',
        preCostoProducto = snapshot['preCostoProducto'] ?? '',
        preVentaProducto = snapshot['preVentaProducto'] ?? '',
        stockMinProducto = snapshot['stockMinProducto'] ?? '',
        stockMaxProducto = snapshot['stockMaxProducto'] ?? '',
        impuestoProducto = snapshot['impuestoProducto'] ?? '',
        proveedorProducto = snapshot['proveedorProducto'] ?? '';

  toJson() {
    return {
      "codigoProducto": codigoProducto,
      "nombreProducto": nombreProducto,
      "cantidadProducto": cantidadProducto,
      "preCostoProducto": preCostoProducto,
      "preVentaProducto": preVentaProducto,
      "stockMinProducto": stockMinProducto,
      "stockMaxProducto": stockMaxProducto,
      "impuestoProducto": impuestoProducto,
      "proveedorProducto": proveedorProducto,
    };
  }
}