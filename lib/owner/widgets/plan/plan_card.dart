import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/controllers/client_controller.dart';
import 'package:progra3_proyecto_final/controllers/plan_controller.dart';
import 'package:progra3_proyecto_final/owner/widgets/button_option.dart';
import 'plan_edit.dart';
import 'package:progra3_proyecto_final/user/widgets/warning.dart';

class PlanCard extends StatelessWidget {
  PlanController planController = new PlanController();
  final String id;
  final String nombre;
  final String descripcion;
  final String monto;
  final String fechaCreacion;


  PlanCard({Key key,this.id, this.nombre, this.descripcion, this.monto, this.fechaCreacion});

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
              "Descripcion: " + descripcion,
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
              "Precio: " + monto,
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
              "Fecha de Creacion: " + fechaCreacion,
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
                    planController.removePlan(id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => Warning(text: "Plan borrado",)));
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
                        MaterialPageRoute(builder: (BuildContext context) => PlanEdit(id, nombre, descripcion, monto)));
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
