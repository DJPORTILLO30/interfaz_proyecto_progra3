import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/controllers/client_controller.dart';
import 'package:progra3_proyecto_final/controllers/plan_controller.dart';
import 'package:progra3_proyecto_final/owner/screens/admin_screen.dart';
import 'package:progra3_proyecto_final/widgets/background.dart';
import 'package:progra3_proyecto_final/widgets/button.dart';
import 'package:progra3_proyecto_final/widgets/custom_input.dart';

class PlanEdit extends StatefulWidget{
  final String id;
  final String nombre;
  final String descripcion;
  final String monto;


  PlanEdit(this.id, this.nombre, this.descripcion, this.monto);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlanEdit();
  }

}

class _PlanEdit extends State<PlanEdit>{
  PlanController planController = new PlanController();



  TextEditingController _controllernombre;
  TextEditingController _controllermonto;
  TextEditingController _controllerdescripcion;

  int code = 502;

  @override
  void initState() {
    _controllernombre = new TextEditingController(
        text: widget.nombre);
    _controllerdescripcion = new TextEditingController(
        text: widget.descripcion);
    _controllermonto = new TextEditingController(
        text: widget.monto);
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
                      "Editar plan " + widget.nombre,
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
                        controller: _controllernombre,
                      ),
                    ),
                    Container(
                      child: TextInputCustom(
                        hintText: "Descripcion",
                        inputType: TextInputType.multiline,
                        iconData: Icons.description,
                        suggestions: true,
                        show: false,
                        controller: _controllerdescripcion,
                      ),
                    ),
                    Container(
                      child: TextInputCustom(
                        hintText: "Monto",
                        inputType: TextInputType.number,
                        iconData: Icons.monetization_on,
                        suggestions: false,
                        show: false,
                        controller: _controllermonto,
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
                            planController.editPlan(widget.id, _controllernombre.text, _controllerdescripcion.text, _controllermonto.text);
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
    if(_controllernombre.text == "" || _controllerdescripcion.text == "" || _controllermonto.text == "")
    {
      print("false");
      return false;
    }
    print("true");
    return true;
  }
}
