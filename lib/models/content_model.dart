class Content {
  final int id;
  final String nombre;
  final String resumen;
  final int idGenero;
  final int idCategoria;
  final String idVideo;
  final String urlimagen;
  final String date;


  Content({
     this.id,
     this.nombre,
     this.resumen,
    this.idGenero,
    this.idCategoria,
    this.idVideo,
    this.urlimagen,
    this.date
  });

  //metodo contstructor de la clase a traves de una interfaz
  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      id: json['id'],
      nombre: json['nombre'],
      resumen: json['resumen'],
      idGenero: json['idGenero'],
      idCategoria: json['idCategoria'],
      idVideo: json['idvideo'],
      urlimagen: json['urlimagen'],
      date: json['fecha'],
    );
  }
}