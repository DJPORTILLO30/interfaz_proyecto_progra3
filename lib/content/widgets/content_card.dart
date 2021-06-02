import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/content/screens/content_detail.dart';
import 'package:http/http.dart ' as http;



class Genero {
  final int id;
  final String nombre;
  final String descripcion;

  Genero({
     this.id,
     this.nombre,
     this.descripcion,
  });

  factory Genero.fromJson(Map<String, dynamic> json) {
    return Genero(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
    );
  }
}




class ContentCard extends StatefulWidget {
  Future<Genero> fetchGenero() async {
    final response =
    await http.get(Uri.parse('http://192.168.1.7:8080/genero/'+genero));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Genero.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load genero');
    }
  }

  final double height;
  final String title;
  final String date;
  final String sumary;
  final double width;
  final String videoId;
  double left = 20.0;
  final String pathImage;
  final String categoria;
  final String genero;


  ContentCard({
    Key key,
    @required this.pathImage,
    @required this.width,
    @required this.height,
    this.title,
    this.sumary,
    this.videoId,
    this.date,
    this.left,
    this.categoria,
    this.genero
  });


  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
   Future<Genero> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = widget.fetchGenero();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    final card = Container(
      height: widget.height,
      width: widget.width,
      margin: EdgeInsets.only(
          left: widget.left

      ),


      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFFFFFFFF),width: 5),
        color: Color(0xFFFFFFFF),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.pathImage)
        ),


      ),
    );


    return FutureBuilder<Genero>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return  InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => ContentDetail(title: widget.title,sumary: widget.sumary,date: widget.date,videoId: widget.videoId,categoria: widget.categoria,genero: snapshot.data.nombre,)));
              },
              child: Stack(
                children: <Widget>[
                  card
                ],
              )
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );

  }
}

