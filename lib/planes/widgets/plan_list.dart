import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/content/widgets/content_card.dart';
import 'package:progra3_proyecto_final/planes/widgets/plan.dart';
import 'package:http/http.dart' as http;

//Widget  que contendra nuestros planes
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
  //metodo para obtener la informacion de la base de datos atraves de nuestra API por el metodo .GET ,este sera de tipo Future
  //que es un tipo de Objeto en Dart que potencialmente tednra un valor o un error en algun punto de la ejeccucion
  Future<List> getData() async {
    //creamos nuestro response a traves de la libneria http y el metodo ger al parsearle el URL de donde esta apuntando nuestra API los planes
    final response = await http.get(Uri.parse("http://192.168.1.7:8080/planes"));
    //retornamos el reponse decodificado de JSON
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    //en el constructor del estado inicial del widget ejecutaremos getData
    this.getData();
  }


  @override
  Widget build(BuildContext context) {
    //retornamos un FutureBuilder que contenga un objeto de tipo List
    return FutureBuilder<List>(
      //el futuro de este objeto sera nuestro metodo getData
      future: getData(),
      //y en el constructor le pasaremos el contexto del Widget y el snapshot que es una copia instantanea de informacion de la base de datos
      builder: (context,snapshot){
        if(snapshot.hasError) print(snapshot.error);
        //si el snapshor tiene informacion entonces y no es nulla entonces crearemos un nuevo Item list
        return snapshot.hasData
            ? new ItemList(
          //parametros que recibe nuestro objeto de tipo ItemList en este caso la list que le pasamos es la informacion de la base de datos y el resto vienen desde la clase New User
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

//Clase ItemList que construira nuestros Widget Plan
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
                    //le pasamos los parametros necesarios para la construccion de un Widget de tipo Plan a traves de nuestra list que continee la informacion del snapshot
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