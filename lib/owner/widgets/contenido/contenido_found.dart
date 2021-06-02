import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/owner/widgets/admin_appbar_options.dart';
import 'package:progra3_proyecto_final/owner/widgets/categoria/categoria_find_list.dart';
import 'package:progra3_proyecto_final/owner/widgets/contenido/contenido_find_list.dart';
import 'package:progra3_proyecto_final/widgets/background.dart';

class ContentFound extends StatelessWidget {
  final String Id;
  const ContentFound({Key key,this.Id}) : super(key: key);

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
                ContentFindList(Id: Id,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
