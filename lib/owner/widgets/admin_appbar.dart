import 'package:flutter/material.dart';


//app bar de todas las views del administrador
class AdminAppBar extends StatelessWidget {
  const AdminAppBar({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF0A1149))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          IconButton(icon: Icon(Icons.logout, color: Color(
              0xFFFFFFFF),size: 30,), onPressed: (){
            Navigator.pop(context);
          },padding: EdgeInsets.only(top: 25),),
          Flexible(
              child: Container(
                padding: EdgeInsets.only(top: 25.0, left: 110.0, right: 10.0),
                child: Image(
                  image: AssetImage("assets/img/necflislogo.png"),
                  width: 120,
                  height: 80,
                ),
              )
          )
        ],
      ),
    );
  }
}
