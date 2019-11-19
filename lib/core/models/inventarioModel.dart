
class Inventario {
  String id;
  int codigoInventario;
  String productoInventario;
  int cantidadInventario;
  String fechaElabInventario;
  String fechaExpInventario;
  String bodegaInventario;

  Inventario({this.id,this.codigoInventario,this.productoInventario,this.cantidadInventario, this.fechaElabInventario,this.fechaExpInventario,this.bodegaInventario});

  Inventario.fromMap(Map snapshot,String id) :
        id = id ?? '',
        codigoInventario = snapshot['codigoInventario'] ?? '',
        productoInventario = snapshot['productoInventario'] ?? '',
        cantidadInventario = snapshot['cantidadInventario'] ?? '',
        fechaElabInventario = snapshot['fechaElabInventario'] ?? '',
        fechaExpInventario = snapshot['fechaExpInventario'] ?? '',
        bodegaInventario = snapshot['bodegaInventario'] ?? '';

  toJson() {
    return {
      "codigoInventario": codigoInventario,
      "productoInventario": productoInventario,
      "cantidadInventario": cantidadInventario,
      "fechaElabInventario": fechaElabInventario,
      "fechaExpInventario": fechaExpInventario,
      "bodegaInventario": bodegaInventario,
    };
  }
}