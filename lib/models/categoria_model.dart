
//entietie de Categoria
class Categoria {
  final int id;
  final String nombre;
  final String descripcion;
  final String fecha;



  Categoria({this.id, this.nombre, this.descripcion, this.fecha});

  //metodo contstructor de la clase a traves de una interfaz
  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      fecha: json['fecha'],
    );
  }
}