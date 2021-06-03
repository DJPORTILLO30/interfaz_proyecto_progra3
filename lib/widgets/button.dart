import 'package:flutter/material.dart';

//Widget para crear un boton con solo texto a traves de Inkwell y un contenedor
class Button extends StatefulWidget{

  double width = 0.0;
  double height = 0.0;
  int color1 ;
  int color2 ;
  final String text;
  final VoidCallback onPressed;


  Button({Key key, @required this.text,@required this.onPressed,this.width,this.height,this.color1,this.color2});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Button();
  }

}


class _Button extends State<Button>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed ,
      child: Container(
        margin: EdgeInsets.only(
            top: 10.0,
            left: 10.0,
            right: 10.0,
            bottom: 5
        ),
        width: widget.width ,
        height: widget.height ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          gradient: LinearGradient(
              colors: [
                Color(widget.color1),
                Color(widget.color2)
              ],
              begin: FractionalOffset(0.5, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp

          ),

        ),

        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                widget.text,
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "Lato",
                    color: Colors.white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}