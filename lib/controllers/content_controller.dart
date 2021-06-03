import 'dart:convert';

import 'package:http/http.dart' as http;


class ContentController {

  //metodo para agregar un contenido
  Future<http.Response> addContent(String nameController,
      String sumaryController, String idCategoriaController,
      String idGeneroController, String idvideoController,
      String urlimagenController) async {
    var url = 'http://192.168.1.7:8080/contenido';

    Map data = {
      'nombre': '$nameController',
      'resumen': '$sumaryController',
      'idCategoria': '$idCategoriaController',
      'idGenero': '$idGeneroController',
      'idvideo': '$idvideoController',
      'urlimagen': '$urlimagenController',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  //Funcion para eliminar un contenido a la BD
  Future<http.Response> removeContent(String id) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://192.168.1.7:8080/contenido/$a';

    var response =
    await http.delete(Uri.parse(url), headers: {"Content-Type": "application/json"});
    print("${response.statusCode}");
    return response;
  }

  //editar contenido
  Future<http.Response> editContent(String id, String nameController,
      String sumaryController, String idCategoriaController,
      String idGeneroController, String idvideoController,
      String urlimagenController) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://192.168.1.7:8080/contenido/$a';

    Map data = {
      'id': '$a',
      'nombre': '$nameController',
      'resumen': '$sumaryController',
      'idCategoria': '$idCategoriaController',
      'idGenero': '$idGeneroController',
      'idvideo': '$idvideoController',
      'urlimagen': '$urlimagenController',
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