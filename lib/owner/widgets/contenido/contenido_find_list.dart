import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progra3_proyecto_final/models/content_model.dart';
import 'package:progra3_proyecto_final/owner/widgets/contenido/contenido_card.dart';

class ContentFindList extends StatefulWidget {
  final String Id;
  const ContentFindList({Key key,this.Id}) : super(key: key);

  Future<Content> fetchCategoria() async {
    final response =
    await http.get(Uri.parse('http://192.168.1.7:8080/contenido/$Id'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Content.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load contenido');
    }
  }


  @override
  _ContentFindListState createState() => _ContentFindListState();
}

class _ContentFindListState extends State<ContentFindList> {
  Future<Content> futureContent;




  @override
  void initState() {
    super.initState();
    futureContent = this.widget.fetchCategoria();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 0,bottom: 10),
            child: Text(
              "Contenidos",
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

                      child:FutureBuilder<Content>(
                        future: futureContent,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView(
                              children: <Widget>[
                              ContentAdminCard(id: snapshot.data.id.toString(),nombre: snapshot.data.nombre ,resumen: snapshot.data.resumen ,idCategoria: snapshot.data.idCategoria.toString(),idGenero: snapshot.data.idGenero.toString(),fecha: snapshot.data.date ,idvideo: snapshot.data.idVideo ,urlimagen: snapshot.data.urlimagen,)
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



