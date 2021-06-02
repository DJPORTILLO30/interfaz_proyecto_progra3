import 'package:flutter/material.dart';
import 'package:progra3_proyecto_final/planes/widgets/plan_app_bar.dart';
import 'package:progra3_proyecto_final/planes/widgets/plan_list.dart';
import 'package:progra3_proyecto_final/widgets/background.dart';

class PlanScreen extends StatelessWidget {
  final String name;
  final String password;
  final String age;
  final String country;
  final String sexo;
  final String email;

  const PlanScreen({Key key,this.name,this.password,this.country,this.age,this.sexo,this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackGround(),
          PlanAppBar(title: "Selecciona tu plan",),
          PlanList(name: name,password: password,age: age,country: country,sexo: sexo,email: email,)
        ],
      ),
    );
  }
}
