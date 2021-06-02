import 'dart:convert';

import 'package:http/http.dart' as http;


class CategoryController {

  Future<http.Response> addCategory(String nameController,
      String descriptionController) async {
    var url = 'http://192.168.1.7:8080/categoria/';

    Map data = {
      'nombre': '$nameController',
      'descripcion': '$descriptionController',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  //Funcion para eliminar un categoria a la BD
  Future<http.Response> removeCategory(String id) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://192.168.1.7:8080/categoria/$a';

    var response =
    await http.delete(Uri.parse(url), headers: {"Content-Type": "application/json"});
    print("${response.statusCode}");
    return response;
  }

  //editar categoria
  Future<http.Response> editCategory(String id, String nameController,
      String descriptionController) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://192.168.1.7:8080/categoria/$a';

    Map data = {
      'id': '$a',
      'nombre': '$nameController',
      'descripcion': '$descriptionController',
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