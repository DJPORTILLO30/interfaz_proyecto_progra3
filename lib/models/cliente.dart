class Cliente {
  final int id;
  final String nombre;
  final String email;
  final int edad;
  final String sexo;
  final String pais;
  final String password;
  final String fecha;
  final String rol;


  Cliente({this.id, this.nombre, this.email, this.edad, this.sexo, this.pais,
      this.password, this.rol,this.fecha});

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      nombre: json['nombre'],
      email: json['email'],
      edad: json['edad'],
      sexo: json['sexo'],
      pais: json['pais'],
      password: json['password'],
      rol: json['rol'],
      fecha: json['fecha'],
    );
  }
}