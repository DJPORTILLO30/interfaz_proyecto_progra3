import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/owner/widgets/admin_appbar_options.dart';
import 'package:progra3_proyecto_final/owner/widgets/genero/genero_find_list.dart';
import 'package:progra3_proyecto_final/widgets/background.dart';

class GeneroFound extends StatelessWidget {
  final String Id;
  const GeneroFound({Key key,this.Id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget> [
          BackGround(),
          AdminAppBarOptions(),
          Container(
            margin: EdgeInsets.only(top: screenHeigth/6),
            child: ListView(
              children: <Widget>[
                GeneroFindList(Id: Id,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
