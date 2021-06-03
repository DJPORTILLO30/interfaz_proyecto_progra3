import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/owner/screens/admin_categoria_view.dart';
import 'package:progra3_proyecto_final/owner/screens/admin_content_view.dart';
import 'package:progra3_proyecto_final/owner/screens/admin_genero.dart';
import 'package:progra3_proyecto_final/owner/screens/admin_pago_view.dart';
import 'package:progra3_proyecto_final/owner/screens/admin_plan_view.dart';
import 'package:progra3_proyecto_final/owner/screens/admin_users_view.dart';
import 'package:progra3_proyecto_final/widgets/button_with_icon.dart';


//opcioens disponibles que tiene el administrador
class AdminOptions extends StatefulWidget {
  const AdminOptions({Key key}) : super(key: key);

  @override
  _AdminOptionsState createState() => _AdminOptionsState();
}

class _AdminOptionsState extends State<AdminOptions> {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF0A1149),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget> [
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             Container(
               alignment: Alignment.center,
               child:  ButtonWithIcon(
                 text: "Clientes",
                 width: 150,
                 color1: 0xFFa2071d,
                 color2: 0xFFd92e40,
                 height: 150,
                 icon: Icons.person,
                 onPressed: (){
                   Navigator.push(
                       context,
                       MaterialPageRoute(builder: (BuildContext context) => AdminUsersView()));
                 },
               ),
             ),
             Container(
               alignment: Alignment.center,
               child:  ButtonWithIcon(
                 text: "Planes",
                 width: 150,
                 color1: 0xFFa2071d,
                 color2: 0xFFd92e40,
                 icon: Icons.assignment,
                 height: 150,
                 onPressed: (){
                   Navigator.push(
                       context,
                       MaterialPageRoute(builder: (BuildContext context) => AdminPlanView()));
                 },
               ),
             )
           ],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             Container(
               alignment: Alignment.center,
               child:  ButtonWithIcon(
                 text: "Pagos",
                 width: 150,
                 color1: 0xFFa2071d,
                 icon: Icons.monetization_on,
                 color2: 0xFFd92e40,
                 height: 150,
                 onPressed: (){
                   Navigator.push(
                       context,
                       MaterialPageRoute(builder: (BuildContext context) => AdminPagoView()));
                 },
               ),
             ),
             Container(
               alignment: Alignment.center,
               child:  ButtonWithIcon(
                 text: "Categorias",
                 width: 150,
                 icon: Icons.web_asset_outlined,
                 color1: 0xFFa2071d,
                 color2: 0xFFd92e40,
                 height: 150,
                 onPressed: (){
                   Navigator.push(
                       context,
                       MaterialPageRoute(builder: (BuildContext context) => AdminCategoria()));
                 },
               ),
             )
           ],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             Container(
               alignment: Alignment.center,
               child:  ButtonWithIcon(
                 text: "Generos",
                 width: 150,
                 color1: 0xFFa2071d,
                 icon: Icons.web,
                 color2: 0xFFd92e40,
                 height: 150,
                 onPressed: (){
                   Navigator.push(
                       context,
                       MaterialPageRoute(builder: (BuildContext context) => AdminGenero()));

                 },
               ),
             ),
             Container(
               alignment: Alignment.center,
               child:  ButtonWithIcon(
                 text: "Contenido",
                 width: 150,
                 color1: 0xFFa2071d,
                 icon: Icons.play_arrow,
                 color2: 0xFFd92e40,
                 height: 150,
                 onPressed: (){
                   Navigator.push(
                       context,
                       MaterialPageRoute(builder: (BuildContext context) => AdminContentView()));
                 },
               ),
             )
           ],
         )
       ],
      ),
    );
  }
}
