
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/controllers/pago_controller.dart';
import 'package:progra3_proyecto_final/owner/screens/admin_screen.dart';
import 'package:progra3_proyecto_final/widgets/background.dart';
import 'package:progra3_proyecto_final/widgets/button.dart';
import 'package:progra3_proyecto_final/widgets/custom_input.dart';

class PagoEdit extends StatefulWidget{
  final String id;
  final String estado;
  final String numTarjeta;
  final String monto;


  PagoEdit(this.id, this.estado, this.numTarjeta, this.monto);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlanEdit();
  }

}

class _PlanEdit extends State<PagoEdit>{
  PagoController pagoController = new PagoController();



  TextEditingController _controllerEstado;
  TextEditingController _controllerMonto;
  TextEditingController _controllerDescripcion;

  int code = 502;

  @override
  void initState() {
    _controllerEstado = new TextEditingController(
        text: widget.estado);
    _controllerDescripcion = new TextEditingController(
        text: widget.numTarjeta);
    _controllerMonto = new TextEditingController(
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
                      "Editar Pago " + widget.id,
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
                        hintText: "Estado",
                        inputType: TextInputType.name,
                        iconData: Icons.drive_file_rename_outline,
                        suggestions: true,
                        show: false,
                        controller: _controllerEstado,
                      ),
                    ),
                    Container(
                      child: TextInputCustom(
                        hintText: "No. Tarjeta",
                        inputType: TextInputType.multiline,
                        iconData: Icons.description,
                        suggestions: true,
                        show: false,
                        controller: _controllerDescripcion,
                      ),
                    ),
                    Container(
                      child: TextInputCustom(
                        hintText: "Monto",
                        inputType: TextInputType.number,
                        iconData: Icons.monetization_on,
                        suggestions: false,
                        show: false,
                        controller: _controllerMonto,
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
                            pagoController.editPago(widget.id, _controllerEstado.text, _controllerDescripcion.text, _controllerMonto.text);
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
    if(_controllerEstado.text == "" || _controllerDescripcion.text == "" || _controllerMonto.text == "")
    {
      print("false");
      return false;
    }
    print("true");
    return true;
  }
}
