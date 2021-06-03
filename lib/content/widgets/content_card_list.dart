import 'dart:convert';

import 'package:flutter/material.dart';
import 'content_card.dart';
import 'package:http/http.dart' as http;



class ContentCardList extends StatefulWidget {
  final String title;
  final String idCategoria;
  final String nombrecategoria;
  const ContentCardList({Key key, this.title,this.idCategoria,this.nombrecategoria}) : super(key: key);

  @override
  _ContentCardListState createState() => _ContentCardListState();
}

class _ContentCardListState extends State<ContentCardList> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse("http://192.168.1.7:8080/contenido/categoria/"+widget.idCategoria));
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }


  @override
  Widget build(BuildContext context) {
    double width = 300;
    double height =350;
    double left = 20.0;
    return Column(
      children: <Widget>[
        Container(
          child: Text(
            widget.title,
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF0A1149),
          ),
          height: 350.0,
          child: ListView(
            padding: EdgeInsets.all(25.0),
            scrollDirection: Axis.horizontal,
            children: <Widget>[

            FutureBuilder<List>(
                  future: getData(),
                  builder: (context,snapshot){
                    if(snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                      ? new ItemList(
                      list:snapshot.data,
                      categoria: widget.title,
                    )
                    : new Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),

            ],
          ),
        )
      ],
    );
  }

}



class ItemList extends StatelessWidget {



  final List list;
  final String categoria;
  ItemList({this.list, this.categoria});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
      itemCount: list==null ? 0: list.length,
      itemBuilder: (context,i) {
        return ContentCard(pathImage: list[i]['urlimagen'].toString(),title: list[i]['nombre'].toString(),sumary: list[i]['resumen'].toString(),date: list[i]['fecha'].toString(),videoId: list[i]['idvideo'].toString(),categoria: categoria,genero: list[i]['idGenero'].toString(),
            width: 300, height: 350, left:20.00);
      }
      );
  }
}

