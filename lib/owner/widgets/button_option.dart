import 'package:flutter/material.dart';

class ButtonOption extends StatefulWidget{

  double width = 0.0;
  double height = 0.0;
  final String text;
  final VoidCallback onPressed;
  var icon;
  final int color1;
  final int color2;
  int color3;

  ButtonOption({Key key, @required this.text,@required this.onPressed,this.width,this.height,this.icon, this.color1,this.color2,this.color3});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonOption();
  }

}


class _ButtonOption extends State<ButtonOption>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed ,
      child: Container(
        margin: EdgeInsets.only(
            top: 5.0,
            left: 10.0,
            right: 15.0
        ),
        width: widget.width ,
        height:widget.height ,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 2.0)
          ],
          borderRadius: BorderRadius.circular(25.0),
          gradient: LinearGradient(
              colors: [
                Color(widget.color1),
                Color(widget.color2)
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp

          ),

        ),

        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Icon(widget.icon,color: Colors.white,)

            ],
          ),
        ),
      ),
    );
  }

}