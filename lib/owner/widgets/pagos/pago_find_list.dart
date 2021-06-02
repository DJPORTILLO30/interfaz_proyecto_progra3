import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progra3_proyecto_final/models/pago_model.dart';
import 'package:progra3_proyecto_final/models/plan_model.dart';
import 'package:progra3_proyecto_final/owner/widgets/pagos/pago_card.dart';
import 'package:progra3_proyecto_final/owner/widgets/plan/plan_card.dart';

class PagoFindList extends StatefulWidget {
  final String Id;
  const PagoFindList({Key key,this.Id}) : super(key: key);

  Future<Pago> fetchPago() async {
    final response =
    await http.get(Uri.parse('http://192.168.1.7:8080/pagos/$Id'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Pago.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load pago');
    }
  }


  @override
  _PagoFindListState createState() => _PagoFindListState();
}

class _PagoFindListState extends State<PagoFindList> {
  Future<Pago> futurePago;




  @override
  void initState() {
    super.initState();
    futurePago = this.widget.fetchPago();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 0,bottom: 10),
            child: Text(
              "Pagos",
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

                      child:FutureBuilder<Pago>(
                        future: futurePago,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView(
                              children: <Widget>[
                              PagoCard(id: snapshot.data.id.toString(),estado: snapshot.data.estado,NumTarjeta: snapshot.data.numTarjeta.toString(),monto: snapshot.data.monto.toString(),fecha: snapshot.data.fecha,)
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



