import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/content/widgets/content_card_list.dart';
import 'package:progra3_proyecto_final/owner/widgets/admin_appbar_options.dart';
import 'package:progra3_proyecto_final/owner/widgets/categoria/categoria_card_list.dart';
import 'package:progra3_proyecto_final/owner/widgets/contenido/contenido_card_list.dart';
import 'package:progra3_proyecto_final/widgets/background.dart';

class AdminContentView extends StatelessWidget {
  const AdminContentView({Key key}) : super(key: key);

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
                ContenidoCardList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
