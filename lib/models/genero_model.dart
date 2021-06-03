class Genero {
  final int id;
  final String nombre;
  final String descripcion;
  final String fecha;



  Genero({this.id, this.nombre, this.descripcion, this.fecha});

  //metodo contstructor de la clase a traves de una interfaz
  factory Genero.fromJson(Map<String, dynamic> json) {
    return Genero(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      fecha: json['fecha'],
    );
  }
}