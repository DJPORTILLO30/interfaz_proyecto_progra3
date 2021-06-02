import 'package:flutter/material.dart';

class TextInputCustom extends StatelessWidget{

  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final IconData iconData;
  final bool suggestions;
  final bool show;
  bool enable= true;

  TextInputCustom(
      {
        Key key,
        @required this.hintText,
        @required this.iconData,
        @required this.inputType,
        @required this.suggestions,
        @required this.show,
        @required this.controller,
        this.enable
      }
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(right: 20.0, left: 20.0,bottom: 20),
      child: TextField(
        enabled: enable,
        controller: controller,
        keyboardType: inputType,
        style: TextStyle(
            fontSize: 15.0,
            fontFamily: "Lato",
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold
        ),

        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 15.0,fontFamily: "Lato", color: Colors.white),
            prefixIcon: Icon(iconData,
              color: Colors.white,
            ),

            fillColor: Color(0xFF0A1149),
            filled: true,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF0A1149)),
                borderRadius: BorderRadius.all(Radius.circular(12.0))
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFa2071d)),
                borderRadius: BorderRadius.all(Radius.circular(12.0))
            )
        ),
        maxLines: 1,
        enableSuggestions: suggestions,
        obscureText: show,
      ),

    );
  }

}