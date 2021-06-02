import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/content/screens/content_cata.dart';
import 'package:progra3_proyecto_final/content/screens/content_detail.dart';
import 'package:progra3_proyecto_final/controllers/client_controller.dart';
import 'package:progra3_proyecto_final/owner/screens/admin_screen.dart';
import 'package:progra3_proyecto_final/planes/screens/plan_screen.dart';
import 'package:progra3_proyecto_final/user/screens/new_user.dart';
import 'package:progra3_proyecto_final/user/widgets/warning.dart';
import 'package:progra3_proyecto_final/widgets/background.dart';
import 'package:progra3_proyecto_final/widgets/button.dart';
import 'package:progra3_proyecto_final/widgets/custom_input.dart';
import 'package:http/http.dart' as http;




Future<List<User>> fetchClient(http.Client client,String email) async {
  final response = await client
      .get(Uri.parse('http://192.168.1.7:8080/cliente/email/$email'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseClient, response.body);
}

// A function that converts a response body into a List<Photo>.
List<User> parseClient(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

class User {
  final String email;
  final String password;
  final String rol;

  User({
     this.email,
     this.password,
     this.rol,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String,
      password: json['password'] as String,
      rol:  json['rol'] as String,

    );
  }
}


class LoginScreen extends StatelessWidget {
  ClientController clientController = new ClientController();

  LoginScreen({Key key}) : super(key: key);
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;

    //Scaffold contenedor de toda la pantalla
    return Scaffold(
      //stack para apilar los widgets
      body: Stack(
        alignment: Alignment.center,
        children: <Widget> [
          BackGround(),
          Container(
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    //email input
                    Container(
                      width: screenWidth/2,
                      height: screenHeigth/4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/img/necflislogo.png")
                          )
                      ),
                    ),
                    //password input
                    Container(
                      child: TextInputCustom(
                        hintText: "Email",
                        inputType: TextInputType.emailAddress,
                        iconData: Icons.person,
                        suggestions: true,
                        show: false,
                        controller: _controllerEmail,
                      ),
                    ),
                    Container(
                      child: TextInputCustom(
                        hintText: "Contraseña",
                        inputType: TextInputType.text,
                        iconData: Icons.vpn_key,
                        suggestions: false,
                        show: true,
                        controller: _controllerPassword,
                      ),
                    ),
            FutureBuilder<List<User>>(
              future: fetchClient(http.Client(),_controllerEmail.text),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if(snapshot.data.isNotEmpty){
                    return   Button(
                      text: "Ingresar",
                      color1: 0xFFa2071d,
                      color2: 0xFFd92e40,
                      width: 150,
                      height: 50,
                      onPressed: (){
                        if(_controllerEmail.text == snapshot.data[0].email){
                          if(_controllerPassword.text == snapshot.data[0].password){
                            if(snapshot.data[0].rol=="usuario"){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (BuildContext context) => ContentCatolog()));
                            }
                            else if(snapshot.data[0].rol == "admin"){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (BuildContext context) => AdminScreen()));
                            }
                          }
                          else{
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (BuildContext context) => Warning(text: "Password Incorrecto",)));
                          }
                          }
                      },
                    );
                  }else {
                    return Text(
                        "Ese email no existe",
                        style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lato",
                        fontSize: 25,
                    ),
                );
                  }
                  }

                else if (snapshot.hasError) {
                  return Text(
                    "Ingresa tu email para continuar",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Lato",
                      fontSize: 25,
                    ),
                  );
                }
                // By default, show a loading spinner.
                return Text(
                  "Ingresa tu email para continuar",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Lato",
                    fontSize: 25,
                  ),
                );
              },
            ),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            "¿No tienes una cuenta?",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Lato",
                              fontSize: 15,
                            ),
                          ),
                        )
                    ),
                    Container(
                      alignment: Alignment.center,
                      child:  Button(
                        text: "Crear cuenta",
                        width: 150,
                        color1:0xFF040721 ,
                        color2: 0xFF040721,
                        height: 50,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) => NewUser()));
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


