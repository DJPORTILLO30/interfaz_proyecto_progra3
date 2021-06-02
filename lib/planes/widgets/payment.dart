import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progra3_proyecto_final/controllers/client_controller.dart';
import 'package:progra3_proyecto_final/controllers/pago_controller.dart';
import 'package:progra3_proyecto_final/user/widgets/button.dart';
import 'package:progra3_proyecto_final/widgets/custom_input.dart';

class PaymentPopUp extends StatelessWidget {


  final String name;
  final String password;
  final String age;
  final String country;
  final String sexo;
  final String email;
  final String monto;

  final _controllerTarjeta = TextEditingController();

  PaymentPopUp({ Key key,
      this.name, this.password, this.age, this.country, this.sexo, this.email,this.monto});

  @override
  Widget build(BuildContext context) {
    ClientController clientController = new ClientController();
    PagoController pagoController = new PagoController();
    return AlertDialog(
      backgroundColor: Color(0xFF040721),
      title: Text('Necflis pago:',
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFFFFFFFF),
        ),),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Ingresa tu numero de tarjeta para continuar' ,
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFFFFFF),
              ),),
            Text('El importe total es de Q' + monto ,
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFFFFFF),
              ),),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextInputCustom(
                hintText: "No. Tarjeta",
                inputType: TextInputType.number,
                iconData: Icons.credit_card,
                suggestions: true,
                show: false,
                controller: _controllerTarjeta,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Button(text: "Cancelar", onPressed: (){
          Navigator.of(context).pop();
        },color1: 0xFFFFFFFF,color2: 0xFFFFFFFF,width: 80, height: 30,color3: 0xFF000000,),
        Button(text: "Aceptar", onPressed: (){
          clientController.addClient(name, age, sexo, country, "usuario", password,email);
          pagoController.addPago("pendiente", _controllerTarjeta.text, monto);
          Navigator.of(context).pop();
        }, color1: 0xFFa2071d, color2: 0xFFd92e40,width: 100, height: 40,color3: 0xFFFFFFFF,),


      ],
    );
  }

}
