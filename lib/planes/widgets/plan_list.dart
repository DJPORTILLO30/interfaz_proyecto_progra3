import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/content/widgets/content_card.dart';
import 'package:progra3_proyecto_final/planes/widgets/plan.dart';
import 'package:http/http.dart' as http;

class PlanList extends StatefulWidget {
  final String name;
  final String password;
  final String age;
  final String email;
  final String country;
  final String sexo;

  const PlanList({Key key,this.name,this.age,this.password,this.sexo,this.country,this.email}) : super(key: key);

  @override
  _PlanListState createState() => _PlanListState();
}

class _PlanListState extends State<PlanList> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse("http://192.168.1.7:8080/planes"));
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: getData(),
      builder: (context,snapshot){
        if(snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? new ItemList(
          list:snapshot.data,
          name: widget.name,
          age: widget.age,
          sexo: widget.sexo,
          password: widget.password,
          country: widget.country,
          email: widget.email,
        )
            : new Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}


class ItemList extends StatelessWidget {
  final String name;
  final String email;
  final String password;
  final String age;
  final String country;
  final String sexo;
  final List list;
  ItemList({this.list,this.name,this.age,this.password,this.sexo,this.country,this.email});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list==null ? 0: list.length,
        itemBuilder: (context,i) {
          return Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 150,bottom: 10),
                height: 450.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Plan(planName: list[i]['nombre'].toString(),planDescription: list[i]['descripcion'].toString(),planPrice: list[i]['monto'].toString(),name: name,password: password,age: age,country: country,sexo: sexo,email: email,),
                  ],
                ),
              )
            ],
          );
        }
    );
  }
}