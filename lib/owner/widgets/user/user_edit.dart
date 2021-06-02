import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/controllers/client_controller.dart';
import 'package:progra3_proyecto_final/owner/screens/admin_screen.dart';
import 'package:progra3_proyecto_final/widgets/background.dart';
import 'package:progra3_proyecto_final/widgets/button.dart';
import 'package:progra3_proyecto_final/widgets/custom_input.dart';

class UserEdit extends StatefulWidget{
  final String id;
  final String nombre;
  final String email;
  final String edad;
  final String sexo;
  final String pais;
  final String password;
  final String rol;


  UserEdit(this.id, this.nombre, this.email, this.edad, this.sexo, this.pais,
      this.password, this.rol);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserEdit();
  }

}

class _UserEdit extends State<UserEdit>{
  ClientController clientController = new ClientController();



  TextEditingController _controllerUser;
  TextEditingController _controllerEdad;
  TextEditingController _controllerEmail;
  TextEditingController _controllerPassword ;
  TextEditingController _controllerCountry ;
  TextEditingController _controllerRol;
  TextEditingController _controllerSexo;

  int code = 502;

  @override
  void initState() {
    _controllerUser = new TextEditingController(
        text: widget.nombre);
    _controllerEdad = new TextEditingController(
        text: widget.edad);
    _controllerEmail = new TextEditingController(
        text: widget.email);
    _controllerPassword = new TextEditingController(
        text: widget.password);
    _controllerCountry = new TextEditingController(
        text: widget.pais);
    _controllerRol = new TextEditingController(
        text: widget.rol);
    _controllerSexo = new TextEditingController(
        text: widget.sexo);
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
                      "Editar cuenta" + widget.nombre,
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
                      child: TextInputCustom(
                        hintText: "Sexo",
                        inputType: TextInputType.number,
                        iconData: Icons.watch_later_rounded,
                        suggestions: true,
                        show: false,
                        controller: _controllerSexo,
                      ),
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
                      child: TextInputCustom(
                        hintText: "Rol",
                        enable: false,
                        inputType: TextInputType.text,
                        iconData: Icons.account_circle,
                        suggestions: true,
                        show: false,
                        controller: _controllerRol,
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
                            clientController.editClient(
                                widget.id,
                                _controllerUser.text, _controllerEdad.text, _controllerSexo.text,
                                _controllerCountry.text, _controllerRol.text, _controllerPassword.text, _controllerEmail.text);
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
    if(_controllerEmail.text == "" || _controllerUser.text == "" || _controllerCountry.text == "" || _controllerPassword.text == "" ||  _controllerEdad.text == "" )
    {
      print("false");
      return false;
    }
    print("true");
    return true;
  }
}
