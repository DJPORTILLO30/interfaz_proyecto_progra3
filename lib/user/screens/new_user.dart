import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progra3_proyecto_final/controllers/client_controller.dart';
import 'package:progra3_proyecto_final/planes/screens/plan_screen.dart';
import 'package:progra3_proyecto_final/user/widgets/warning.dart';
import 'package:progra3_proyecto_final/widgets/background.dart';
import 'package:progra3_proyecto_final/widgets/button.dart';
import 'package:progra3_proyecto_final/widgets/check_box_label.dart';
import 'package:progra3_proyecto_final/widgets/custom_input.dart';


//Clase para crear la pantalla donde se crearan nuevas cuentas
class NewUser extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewUser();
  }

}

  class _NewUser extends State<NewUser>{


    //Parametros de la clase
    final _controllerUser = TextEditingController();
    final _controllerEdad = TextEditingController();
    final _controllerEmail = TextEditingController();
    final _controllerPassword = TextEditingController();
    final _controllerRePassword = TextEditingController();
    final _controllerCountry = TextEditingController();
    bool m = false;
    int code = 502;
    bool f = false;



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
                      "Crear cuenta",
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
                        iconData: Icons.person,
                        suggestions: true,
                        show: false,
                        controller: _controllerUser,
                      ),
                    ),
                    Container(
                      child: TextInputCustom(
                        hintText: "Email",
                        inputType: TextInputType.emailAddress,
                        iconData: Icons.email,
                        suggestions: true,
                        show: false,
                        controller: _controllerEmail,
                      ),
                    ),
                    Container(
                      child: TextInputCustom(
                        hintText: "Contraseña",
                        inputType: TextInputType.visiblePassword,
                        iconData: Icons.vpn_key_rounded,
                        suggestions: false,
                        show: true,
                        controller: _controllerPassword,
                      ),
                    ),
                    Container(
                      child: TextInputCustom(
                        hintText: "Verificar contraseña",
                        inputType: TextInputType.visiblePassword,
                        iconData: Icons.vpn_key_outlined,
                        suggestions: false,
                        show: true,
                        controller: _controllerRePassword,
                      ),
                    ),
                    Container(
                      child: TextInputCustom(
                        hintText: "Edad",
                        inputType: TextInputType.number,
                        iconData: Icons.watch_later_rounded,
                        suggestions: true,
                        show: false,
                        controller: _controllerEdad,
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "Sexo",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 15.00,left: 15,right: 15,bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF0A1149),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 10.0),
                                child: CheckBoxLabel(
                                  label: 'Hombre',
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  value: m,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      m = newValue;
                                      f =!newValue;
                                    });
                                  },
                                )
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 10.0),
                                child: CheckBoxLabel(
                                  label: 'Mujer',
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  value: f,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      f = newValue;
                                      m =!newValue;
                                    });
                                  },
                                )
                            ),
                          ],
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 25),
                      alignment: Alignment.centerLeft,
                      child: Button(
                        text: "SELECCIONA TU PAIS",
                        color1: 0xFFa2071d,
                        color2: 0xFFd92e40,
                        width: 250,
                        height: 50,
                        onPressed: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: false,
                            onSelect: (Country country) async {
                              _controllerCountry.text = country.displayNameNoCountryCode;
                            },
                          );
                        },
                      ),
                    ),

                    Container(
                      child: TextInputCustom(
                        hintText: "País",
                        enable: false,
                        inputType: TextInputType.emailAddress,
                        iconData: Icons.map,
                        suggestions: true,
                        show: false,
                        controller: _controllerCountry,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Button(
                        text: "Crear cuenta",
                        color1: 0xFFa2071d,
                        color2: 0xFFd92e40,
                        width: 120,
                        height: 50,
                        onPressed: () {
                          crear();

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
  //Metodo para verficar que todos los campos de texto hayan sido llenados
  bool complete(){
    if(_controllerEmail.text == "" || _controllerUser.text == "" || _controllerCountry.text == "" || _controllerPassword.text == "" || _controllerRePassword.text == "" || _controllerEdad.text == "" || f==false &&  m==false)
      {
        print("false");
        return false;
      }
    print("true");
    return true;
  }

  //Metodo para crear una nueva cuenta
  void crear(){
    //si todos los campos estan completos
    if(complete()==true){
      //entonces si la contraseña es la misma en el campo de contraseña como en el de verficar contraseña
      if(_controllerPassword.text==_controllerRePassword.text){
        if(f==true){
          //si la checkbox mujer esta seleccionada osea su valor es true entonces llamaremos el navigator para pasar a la pantalla de plan screen y le pasamos los parametros de este form
          Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => PlanScreen(name: _controllerUser.text,password: _controllerPassword.text,country: _controllerCountry.text,age: _controllerEdad.text,sexo: "Mujer",email: _controllerEmail.text,)));
        }else if(m==true){
          //si la checkbox hombre esta seleccionada osea su valor es true entonces llamaremos el navigator para pasar a la pantalla de plan screen y le pasamos los parametros de este form
          Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => PlanScreen(name: _controllerUser.text,password: _controllerPassword.text,country: _controllerCountry.text,age: _controllerEdad.text,sexo: "Hombre",email: _controllerEmail.text,)));
        }
      }else{
        //si las contraseñas no coinciden lanzaremos un warning
        Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => Warning(text: "Las contraseñas no coinciden",)));

      }
    }else{
      //si falta algun campo por llenar
      Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Warning(text: "Completa todos los campos",)));

    }

  }
}
