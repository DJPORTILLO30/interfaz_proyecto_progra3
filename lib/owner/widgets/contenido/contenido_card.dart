import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/controllers/category_controller.dart';
import 'package:progra3_proyecto_final/controllers/content_controller.dart';
import 'package:progra3_proyecto_final/owner/widgets/button_option.dart';
import 'contenido_edit.dart';
import 'package:progra3_proyecto_final/user/widgets/warning.dart';

class ContentAdminCard extends StatelessWidget {
  ContentController contentController = new ContentController();
  final String id;
  final String nombre;
  final String resumen;
  final String idCategoria;
  final String idGenero;
  final String fecha;
  final String idvideo;
  final String urlimagen;


  ContentAdminCard({Key key,this.id, this.nombre, this.resumen, this.idCategoria,this.idGenero,this.fecha,this.idvideo,this.urlimagen});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF0A1149),
      ),
      margin: EdgeInsets.only(top: 0,bottom: 20,right: 10,left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10,left: 10,top: 10),
            child: Text(
              "ID: " + id,
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "Lato",
                  color: Colors.white
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10,left: 10),
            child: Text(
              "Nombre: " + nombre,
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "Lato",
                  color: Colors.white
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10,left: 10),
            child: Text(
              "Resumen: " + resumen,
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "Lato",
                  color: Colors.white
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10,left: 10),
            child: Text(
              "ID Categoria: " + idCategoria,
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "Lato",
                  color: Colors.white
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10,left: 10),
            child: Text(
              "ID Genero: " + idGenero,
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "Lato",
                  color: Colors.white
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10,left: 10),
            child: Text(
              "Fecha: " + fecha,
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "Lato",
                  color: Colors.white
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10,left: 10),
            child: Text(
              "ID Video: " + idvideo,
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "Lato",
                  color: Colors.white
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10,left: 10),
            child: Text(
              "URL Imagen: " + urlimagen,
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: "Lato",
                  color: Colors.white
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 15,left: 10,right: 10),
                child: ButtonOption(
                  color1: 0xFFa2071d,
                  color2: 0xFFd92e40,
                  width: 50,
                  height: 50,
                  icon: Icons.delete,
                  onPressed: (){
                    contentController.removeContent(id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => Warning(text: "Contenido eliminado",)));
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15,left: 10,right: 10),
                child: ButtonOption(
                  color1: 0xFFa2071d,
                  color2: 0xFFd92e40,
                  width: 50,
                  height: 50,
                  icon: Icons.edit,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => ContenidoEdit(id, nombre, resumen, idCategoria, idGenero, idvideo, urlimagen)));
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
