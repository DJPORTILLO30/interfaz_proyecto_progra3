import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progra3_proyecto_final/models/cliente.dart';
import 'package:progra3_proyecto_final/owner/widgets/user/user_card.dart';

class UserFindList extends StatefulWidget {
  final String Id;
  const UserFindList({Key key,this.Id}) : super(key: key);

  Future<Cliente> fetchGenero() async {
    final response =
    await http.get(Uri.parse('http://192.168.1.7:8080/cliente/$Id'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Cliente.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load user');
    }
  }


  @override
  _UserFindListState createState() => _UserFindListState();
}

class _UserFindListState extends State<UserFindList> {
  Future<Cliente> futureClient;




  @override
  void initState() {
    super.initState();
    futureClient = this.widget.fetchGenero();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 0,bottom: 10),
          child: Text(
            "Usuarios",
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

            child:FutureBuilder<Cliente>(
              future: futureClient,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: <Widget>[
                      UserCard(id: snapshot.data.id.toString(),nombre: snapshot.data.nombre.toString(),email: snapshot.data.email.toString(),edad: snapshot.data.edad.toString(),sexo: snapshot.data.sexo.toString(),pais: snapshot.data.pais.toString(),password: snapshot.data.password.toString(),fecha: snapshot.data.fecha.toString(),rol: snapshot.data.rol.toString(),)
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



