import 'dart:convert';

import 'package:http/http.dart' as http;


class PlanController {

  //metodo para agregar un plan
  Future<http.Response> addPlan(String nameController,
      String descriptionController,String montoController) async {
    var url = 'http://192.168.1.7:8080/planes/';

    Map data = {
      'nombre': '$nameController',
      'descripcion': '$descriptionController',
      'monto': '$montoController',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  //Funcion para eliminar un plan a la BD
  Future<http.Response> removePlan(String id) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://192.168.1.7:8080/planes/$a';

    var response =
    await http.delete(Uri.parse(url), headers: {"Content-Type": "application/json"});
    print("${response.statusCode}");
    return response;
  }

  //editar plan
  Future<http.Response> editPlan(String id, String nameController,
      String descriptionController,String montoController) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://192.168.1.7:8080/planes/$a';

    Map data = {
      'id': '$a',
      'nombre': '$nameController',
      'descripcion': '$descriptionController',
      'monto': '$montoController',
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