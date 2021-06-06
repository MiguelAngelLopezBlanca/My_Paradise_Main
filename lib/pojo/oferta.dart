class Oferta {
  String nombre;
  String descripcion;
  String nombreArchivo;
  String nomConstructora;
  String nombreImagen;
  String precio;
  String telefono;

  Oferta(
      String nombre,
      String descripcion,
      String nombreArchivo,
      String nomConstructora,
      String precio,
      String nombreImagen,
      String telefono) {
    this.nombre = nombre;
    this.descripcion = descripcion;
    this.nombreArchivo = nombreArchivo;
    this.nomConstructora = nomConstructora;
    this.precio = precio;
    this.nombreImagen = nombreImagen;
    this.telefono = telefono;
  }
}
