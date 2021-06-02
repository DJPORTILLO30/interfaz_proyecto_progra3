class Plan {
  final int id;
  final String nombre;
  final String descripcion;
  final int monto;
  final String fechaCreacion;



  Plan({this.id, this.nombre, this.descripcion, this.monto, this.fechaCreacion});

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      monto: json['monto'],
      fechaCreacion: json['fechaCreacion'],
    );
  }
}