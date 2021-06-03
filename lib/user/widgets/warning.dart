import 'dart:io';
import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/user/widgets/button.dart';


//Widget de tipo ALerDialog perosonalizado para darle avisos al usuario
class Warning extends StatelessWidget {
final String text;

Warning({Key key, this.text});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF040721),
      title: Text('Aviso!',
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFFffffff),
        ),),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(text ,
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: Color(0xFFffffff),
              ),),
          ],
        ),
      ),
      actions: <Widget>[
        Button(text: "Aceptar", onPressed: (){
          Navigator.of(context).pop();
        }, color1: 0xFFa2071d, color2: 0xFFd92e40,width: 100, height: 40,color3: 0xFFFFFFFF,),

      ],
    );
  }
}
