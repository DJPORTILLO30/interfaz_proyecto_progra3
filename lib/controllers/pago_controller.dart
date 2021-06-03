import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;


class PagoController {

  //metodo para agregar un nuevo pago
  Future<http.Response> addPago(String estadoController,
      String numTarjetaController,String montoController) async {
    var url = 'http://192.168.1.7:8080/pagos/';

    double monto = double.parse(montoController);
    double numTarjeta = double.parse(numTarjetaController);

    Map data = {
      'monto': '$monto',
      'numTarjeta': '$numTarjeta',
      'estado': '$estadoController',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  //Funcion para eliminar un pago a la BD
  Future<http.Response> removePago(String id) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://192.168.1.7:8080/pagos/$a';

    var response =
    await http.delete(Uri.parse(url), headers: {"Content-Type": "application/json"});
    print("${response.statusCode}");
    return response;
  }

  //editar pago
  Future<http.Response> editPago(String id, String estadoController,
      String numTarjetaController,String montoController) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://192.168.1.7:8080/pagos/$a';

    double monto = double.parse(montoController);
    double numTarjeta = double.parse(numTarjetaController);


    Map data = {
      'id': '$a',
      'monto': '$monto',
      'numTarjeta': '$numTarjeta',
      'estado': '$estadoController',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.put(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

}