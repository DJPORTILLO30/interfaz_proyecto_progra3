class Pago {
  final int id;
  final String fecha;
  final String estado;
  final double monto;
  final double numTarjeta;



  Pago({this.id, this.fecha, this.estado, this.monto, this.numTarjeta});

  factory Pago.fromJson(Map<String, dynamic> json) {
    return Pago(
      id: json['id'],
      fecha: json['fecha'],
      estado: json['estado'],
      monto: json['monto'],
      numTarjeta: json['numTarjeta'],
    );
  }
}