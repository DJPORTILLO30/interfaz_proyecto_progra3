import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/controllers/client_controller.dart';
import 'package:progra3_proyecto_final/planes/widgets/payment.dart';
import 'package:progra3_proyecto_final/widgets/button.dart';

class Plan extends StatelessWidget {
  String planName;
  String planDescription;
  String planPrice;
  final String email;
  final String name;
  final String password;
  final String age;
  final String country;
  final String sexo;

  Plan({Key key,this.planName ,this.planPrice,this.planDescription,this.name,this.age,this.country,this.sexo,this.password,this.email});

  @override
  Widget build(BuildContext context) {
    ClientController clientController = new ClientController();

    return Container(
      margin: EdgeInsets.only(left: 30),
      width: 350,
      height:250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFF0A1149),
      ),
      child: Column(
        children: <Widget>[
          Text(
            planName,
            style: TextStyle(
                fontSize: 30,
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
          Container(
            height: 250,
            margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                    child:  Text(
                      planDescription,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                          fontFamily: "Lato",
                          color: Colors.white
                      ),
                    )
                )
              ],
            ),
          ),
          Text(
           "Q" + planPrice,
            style: TextStyle(
                fontSize: 25,
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
          Button(text: "Pagar",
              color1: 0xFFa2071d,
              color2: 0xFFd92e40,
              width: 150,
              height: 50,
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => PaymentPopUp(name: name,password: password,country: country,age: age,sexo: sexo,email:email,monto: planPrice,)));
              })
        ],
      ),
    );
  }
}
