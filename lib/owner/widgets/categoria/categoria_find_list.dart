import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progra3_proyecto_final/models/categoria_model.dart';
import 'package:progra3_proyecto_final/owner/widgets/categoria/categoria_card.dart';

class CategoriaFindList extends StatefulWidget {
  final String Id;
  const CategoriaFindList({Key key,this.Id}) : super(key: key);

  Future<Categoria> fetchCategoria() async {
    final response =
    await http.get(Uri.parse('http://192.168.1.7:8080/categoria/$Id'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Categoria.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load categoria');
    }
  }


  @override
  _CategoriaFindListState createState() => _CategoriaFindListState();
}

class _CategoriaFindListState extends State<CategoriaFindList> {
  Future<Categoria> futureCategoria;




  @override
  void initState() {
    super.initState();
    futureCategoria = this.widget.fetchCategoria();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 0,bottom: 10),
            child: Text(
              "Categorias",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Lato",
                  color: Colors.white
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 0,bottom: 10,right: 10,left: 10),
              child: Column(
                children: <Widget>[

                  Container(
                    margin: EdgeInsets.only(top: 0,bottom: 10,right: 10,left: 10),
                    height: 350.0,
                    child: Container(
                      padding: EdgeInsets.all(25.0),

                      child:FutureBuilder<Categoria>(
                        future: futureCategoria,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView(
                              children: <Widget>[
                              CategoriaCard(id: snapshot.data.id.toString(),nombre: snapshot.data.nombre,descripcion: snapshot.data.descripcion,fecha: snapshot.data.fecha,)
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text("Ese ID no existe en nuestra DB",style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato",
                                color: Colors.white
                            ),);
                          }

                          // By default, show a loading spinner.
                          return CircularProgressIndicator();
                        },
                      ),

                    ),
                  )
                ],
              )
          )
        ]
    );
  }
}



