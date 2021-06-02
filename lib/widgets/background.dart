import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeigth,
      color: Color(0xFF040721),
    );
  }
}
