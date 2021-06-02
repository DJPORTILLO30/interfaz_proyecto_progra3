import 'package:flutter/material.dart';

class ContentDate extends StatelessWidget {
  String date;
  ContentDate({Key key , this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Fecha ingresada: " + date,
        style: TextStyle(
            fontSize: 18,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      ),
    );
  }
}
