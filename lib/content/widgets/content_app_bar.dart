import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ContentAppBar extends StatelessWidget {
  String title;
  ContentAppBar({Key key , this.title});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: 10,bottom: 10),
      margin: EdgeInsets.only(bottom: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          IconButton(icon: Icon(Icons.arrow_back, color: Color(
              0xFFFFFFFF),size: 40,), onPressed: (){
            SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
            Navigator.pop(context);
          },padding: EdgeInsets.only(top: 25),),
          Flexible(
              child: Container(
                padding: EdgeInsets.only(top: 25.0, left: 100.0, right: 10.0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Lato",
                      color: Colors.white
                  ),
                )
              )
          )
        ],
      ),
    );
  }
}
