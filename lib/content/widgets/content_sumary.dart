import 'package:flutter/material.dart';

class ContentSumary extends StatelessWidget {
  String sumary;
  ContentSumary({Key key , this.sumary});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        sumary,
        style: TextStyle(
            fontSize: 15,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      ),
    );
  }
}
