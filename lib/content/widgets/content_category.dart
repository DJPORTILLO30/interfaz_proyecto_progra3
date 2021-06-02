import 'package:flutter/material.dart';

class ContentCategory extends StatelessWidget {
  String category;
  ContentCategory({Key keu , this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10,left: 10),
      width: 100,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
            colors: [
              Color(0xFFa2071d),
              Color(0xFFd92e40)
            ],
            begin: FractionalOffset(0.5, 0.0),
            end: FractionalOffset(1.0, 0.6),
            stops: [0.0, 0.6],
            tileMode: TileMode.clamp
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        category,
        style: TextStyle(
            fontSize: 15,
            fontFamily: "Lato",
            color: Colors.white
        ),
      ),
    );
  }
}
