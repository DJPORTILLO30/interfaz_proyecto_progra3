import 'package:flutter/material.dart';

import 'package:progra3_proyecto_final/controllers/pago_controller.dart';
import 'package:progra3_proyecto_final/owner/widgets/button_option.dart';
import 'pago_edit.dart';
import 'package:progra3_proyecto_final/user/widgets/warning.dart';

class PagoCard extends StatelessWidget {
  PagoController pagoController = new PagoController();
  final String id;
  final String estado;
  final String NumTarjeta;
  final String monto;
  final String fecha;


  PagoCard({Key key,this.id, this.estado, this.NumTarjeta, this.monto, this.fecha});

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
              "Estado: " + estado,
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
              "No. Tarjeta: " + NumTarjeta,
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
              "Monto: " + monto,
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
              "Fecha Realizado: " + fecha,
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
                    pagoController.removePago(id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => Warning(text: "Pago borrado",)));
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
                        MaterialPageRoute(builder: (BuildContext context) => PagoEdit(id, estado, NumTarjeta, monto)));
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
