import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/content/widgets/content_card_list.dart';
import 'package:progra3_proyecto_final/widgets/background.dart';
import 'package:http/http.dart' as http;

class ContentCatolog extends StatefulWidget {
  const ContentCatolog({Key key}) : super(key: key);

  @override
  _ContentCatologState createState() => _ContentCatologState();
}

class _ContentCatologState extends State<ContentCatolog> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse("http://192.168.1.7:8080/categoria"));
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackGround(),

              FutureBuilder<List>(
                future: getData(),
                builder: (context,snapshot){
                  if(snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? new ItemList(
                    list:snapshot.data,
                  )
                      : new Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
        ],
      ),
    );
  }
}


class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list==null ? 0: list.length,
        itemBuilder: (context,i) {
          return ContentCardList(title: list[i]['nombre'].toString(),idCategoria: list[i]['id'].toString(),);
        }
    );
  }
}
