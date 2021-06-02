import 'dart:convert';

import 'package:http/http.dart' as http;




class ClientController {

  Future<http.Response> addClient(String nameController,
      String ageController, String sexoController,String paisController,String rolController,String password,String email) async {
    var url = 'http://192.168.1.7:8080/cliente/';

    Map data = {
      'nombre': '$nameController',
      'email': '$email',
      'edad': '$ageController',
      'sexo': '$sexoController',
      'pais': '$paisController',
      'rol': '$rolController',
      'password': '$password',

    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  //Funcion para eliminar un cliente a la BD
  Future<http.Response> removeClient(String id) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://192.168.1.7:8080/cliente/$a';

    var response =
    await http.delete(Uri.parse(url), headers: {"Content-Type": "application/json"});
    print("${response.statusCode}");
    return response;
  }





  //editar cliente
  Future<http.Response> editClient(String id, String nameController,
      String ageController, String sexoController,String paisController,String rolController,String password,String email)  async {
    int a = int.parse(id);
    print(a);
    var url = 'http://192.168.1.7:8080/cliente/$a';

    Map data = {
      'id': '$a',
      'nombre': '$nameController',
      'email': '$email',
      'edad': '$ageController',
      'sexo': '$sexoController',
      'pais': '$paisController',
      'rol': '$rolController',
      'password': '$password',
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