
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/controllers/category_controller.dart';
import 'package:progra3_proyecto_final/controllers/content_controller.dart';
import 'package:progra3_proyecto_final/controllers/pago_controller.dart';
import 'package:progra3_proyecto_final/owner/screens/admin_screen.dart';
import 'package:progra3_proyecto_final/widgets/background.dart';
import 'package:progra3_proyecto_final/widgets/button.dart';
import 'package:progra3_proyecto_final/widgets/custom_input.dart';

class NewContenido extends StatefulWidget{



  NewContenido();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewContenido();
  }

}

class _NewContenido extends State<NewContenido>{
  ContentController contentController = new ContentController();






  @override
  void initState() {
    super.initState();
  }


  final _controllerNombre = TextEditingController();
  final _controllerResumen = TextEditingController();
  final _controllerIdCategoria = TextEditingController();
  final _controllerIdGenero = TextEditingController();
  final _controllerIdVideo = TextEditingController();
  final _controllerUrlImagen = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          BackGround(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              IconButton(icon: Icon(Icons.arrow_back, color: Color(
                  0xFFFFFFFF),size: 30,), onPressed: (){
                Navigator.pop(context);
              },padding: EdgeInsets.only(top: 25),),
              Flexible(
                  child: Container(
                    padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 10.0),
                    child: Text(
                      "Nuevo Contenido",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Lato",
                          color: Colors.white
                      ),
                    ),
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: TextInputCustom(
                        hintText: "Nombre",
                        inputType: TextInputType.name,
                        iconData: Icons.drive_file_rename_outline,
                        suggestions: true,
                        show: false,
                        controller: _controllerNombre,
                      ),
                    ),
                    Container(
                      child: TextInputCustom(
                        hintText: "Resumen",
                        inputType: TextInputType.multiline,
                        iconData: Icons.description,
                        suggestions: true,
                        show: false,
                        controller: _controllerResumen,
                      ),
                    ),
                    Container(
                      child: TextInputCustom(
                        hintText: "Id Categoria",
                        inputType: TextInputType.text,
                        iconData: Icons.ondemand_video,
                        suggestions: true,
                        show: false,
                        controller: _controllerIdCategoria,
                      ),
                    ),
                    Container(
                      child: TextInputCustom(
                        hintText: "Id Genero",
                        inputType: TextInputType.text,
                        iconData: Icons.view_agenda_rounded,
                        suggestions: true,
                        show: false,
                        controller: _controllerIdGenero,
                      ),
                    ),
                    Container(
                      child: TextInputCustom(
                        hintText: "Id Video",
                        inputType: TextInputType.text,
                        iconData: Icons.movie,
                        suggestions: true,
                        show: false,
                        controller: _controllerIdVideo,
                      ),
                    ),
                    Container(
                      child: TextInputCustom(
                        hintText: "URL Imagen",
                        inputType: TextInputType.multiline,
                        iconData: Icons.image,
                        suggestions: true,
                        show: false,
                        controller: _controllerUrlImagen,
                      ),
                    ),

                    Container(
                      alignment: Alignment.centerRight,
                      child: Button(
                        text: "Crear",
                        color1: 0xFFa2071d,
                        color2: 0xFFd92e40,
                        width: 120,
                        height: 50,
                        onPressed: () {
                          if(complete()==true) {
                            contentController.addContent(_controllerNombre.text, _controllerResumen.text, _controllerIdCategoria.text, _controllerIdGenero.text, _controllerIdVideo.text, _controllerUrlImagen.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        AdminScreen()));
                          }
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );


  }
  bool complete(){
    if(_controllerNombre.text == "" || _controllerResumen.text == "" || _controllerIdCategoria.text == "" || _controllerIdGenero.text == "" || _controllerIdVideo.text == "" || _controllerUrlImagen.text == "")
    {
      print("false");
      return false;
    }
    print("true");
    return true;
  }
}
