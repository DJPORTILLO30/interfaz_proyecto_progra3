import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/owner/widgets/admin_appbar.dart';
import 'package:progra3_proyecto_final/owner/widgets/admin_options.dart';
import 'package:progra3_proyecto_final/widgets/background.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget> [
          BackGround(),
         AdminAppBar(),
          Container(
            margin: EdgeInsets.only(top: screenHeigth/6),
            child: ListView(
              children: <Widget>[
                AdminOptions()
              ],
            ),
          )
        ],
      ),
    );
  }
}
