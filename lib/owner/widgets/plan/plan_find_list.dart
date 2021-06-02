import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progra3_proyecto_final/models/plan_model.dart';
import 'package:progra3_proyecto_final/owner/widgets/plan/plan_card.dart';

class PlanFindList extends StatefulWidget {
  final String Id;
  const PlanFindList({Key key,this.Id}) : super(key: key);

  Future<Plan> fetchPlan() async {
    final response =
    await http.get(Uri.parse('http://192.168.1.7:8080/planes/$Id'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Plan.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load plan');
    }
  }


  @override
  _PlanFindListState createState() => _PlanFindListState();
}

class _PlanFindListState extends State<PlanFindList> {
  Future<Plan> futurePlan;




  @override
  void initState() {
    super.initState();
    futurePlan = this.widget.fetchPlan();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 0,bottom: 10),
            child: Text(
              "Planes",
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

                      child:FutureBuilder<Plan>(
                        future: futurePlan,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView(
                              children: <Widget>[
                              PlanCard(id: snapshot.data.id.toString(),nombre: snapshot.data.nombre,descripcion: snapshot.data.descripcion,monto: snapshot.data.monto.toString(),fechaCreacion: snapshot.data.fechaCreacion,)
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



