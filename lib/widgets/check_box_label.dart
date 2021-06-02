import 'package:flutter/material.dart';

class CheckBoxLabel extends StatelessWidget {
  const CheckBoxLabel({
    Key key,
    @required this.label,
    @required this.padding,
    @required this.value,
    @ required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        child: Padding(
          padding: padding,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(label,
                    style: TextStyle(
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
              Checkbox(
                value: value,
                onChanged: (bool newValue) {
                  onChanged(newValue);
                },
                activeColor: Color(0xFFa2071d),
              ),
            ],
          ),
        ),
      ),
    );
  }
}