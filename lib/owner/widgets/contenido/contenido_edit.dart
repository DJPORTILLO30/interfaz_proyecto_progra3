
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/controllers/content_controller.dart';
import 'package:progra3_proyecto_final/owner/screens/admin_screen.dart';
import 'package:progra3_proyecto_final/widgets/background.dart';
import 'package:progra3_proyecto_final/widgets/button.dart';
import 'package:progra3_proyecto_final/widgets/custom_input.dart';

class ContenidoEdit extends StatefulWidget{
  final String id;
  final String nombre;
  final String resumen;
  final String idCategoria;
  final String idGenero;
  final String idvideo;
  final String urlimagen;



  ContenidoEdit(this.id, this.nombre, this.resumen,this.idCategoria,this.idGenero,this.idvideo,this.urlimagen);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ContenidoEdit();
  }

}

class _ContenidoEdit extends State<ContenidoEdit>{
  ContentController contentController = new ContentController();



  TextEditingController _controllerNombre;
  TextEditingController _controllerResumen;
  TextEditingController _controllerIdCategoria;
  TextEditingController _controllerIdGenero;
  TextEditingController _controllerFecha;
  TextEditingController _controllerIdvideo;
  TextEditingController _controllerUrlImagen;
  int code = 502;

  @override
  void initState() {
    _controllerResumen = new TextEditingController(
        text: widget.resumen);
    _controllerNombre = new TextEditingController(
        text: widget.nombre);
    _controllerIdCategoria = new TextEditingController(
        text: widget.idCategoria);
    _controllerIdGenero = new TextEditingController(
        text: widget.idGenero);
    _controllerIdvideo = new TextEditingController(
        text: widget.idvideo);
    _controllerUrlImagen = new TextEditingController(
        text: widget.urlimagen);
    super.initState();
  }



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
                      "Editar Contenido " + widget.nombre,
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
                        inputType: TextInputType.text,
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
                        controller: _controllerIdvideo,
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
                        text: "Editar",
                        color1: 0xFFa2071d,
                        color2: 0xFFd92e40,
                        width: 120,
                        height: 50,
                        onPressed: () {
                          if(complete()==true) {
                            contentController.addContent(_controllerNombre.text, _controllerResumen.text, _controllerIdCategoria.text, _controllerIdGenero.text, _controllerIdvideo.text, _controllerUrlImagen.text);
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
    if(_controllerNombre.text == "" || _controllerResumen.text == "" || _controllerIdCategoria.text == "" || _controllerIdGenero.text == "" || _controllerIdvideo.text == "" || _controllerUrlImagen.text == "")
    {
      print("false");
      return false;
    }
    print("true");
    return true;
  }
}
