import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progra3_proyecto_final/owner/widgets/categoria/categoria_card.dart';
import 'package:progra3_proyecto_final/owner/widgets/categoria/categoria_find_list.dart';
import 'package:progra3_proyecto_final/owner/widgets/categoria/categoria_found.dart';
import 'package:progra3_proyecto_final/owner/widgets/categoria/new_categoria.dart';
import 'package:progra3_proyecto_final/owner/widgets/pagos/new_pago.dart';
import 'package:progra3_proyecto_final/owner/widgets/pagos/pago_found.dart';
import 'package:progra3_proyecto_final/widgets/button.dart';
import 'package:progra3_proyecto_final/widgets/custom_input.dart';

class CategoriaCardList extends StatefulWidget {
  const CategoriaCardList({Key key}) : super(key: key);

  @override
  _CategoriaCardListState createState() => _CategoriaCardListState();
}

class _CategoriaCardListState extends State<CategoriaCardList> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse("http://192.168.1.7:8080/categoria"));
    return json.decode(response.body);
  }



  final _controllerSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.getData();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 0,bottom: 10),
          child: Text(
            "Categorias",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: "Lato",
                color: Colors.white
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 0,bottom: 10,right: 10,left: 10),
          child: Column(
            children: <Widget>[
              Container(
                child: TextInputCustom(
                  hintText: "Buscar por ID",
                  inputType: TextInputType.number,
                  iconData: Icons.search,
                  suggestions: false,
                  show: false,
                  controller: _controllerSearch,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Button(
                    text: "Buscar",
                    width: 150,
                    color1: 0xFFa2071d,
                    color2: 0xFFd92e40,
                    height: 50,
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => CategoriaFound(Id: _controllerSearch.text,)));
                    },
                  ),
                  Button(
                    text: "Nueva Categoria",
                    width: 150,
                    color1: 0xFFa2071d,
                    color2: 0xFFd92e40,
                    height: 50,
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => NewCategoria()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 0,bottom: 10,right: 10,left: 10),
          height: 350.0,
          child: Container(
            padding: EdgeInsets.all(25.0),


            child:FutureBuilder<List>(
              future: getData(),
              builder: (context,snapshot){
                if(snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? new ItemList(
                  list:snapshot.data,
                )
                    : new Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),

          ),
        )
      ],
    );
  }
}


class ItemList extends StatelessWidget {



  final List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list==null ? 0: list.length,
        itemBuilder: (context,i) {
          return CategoriaCard(id: list[i]['id'].toString(),nombre: list[i]['nombre'].toString(),descripcion: list[i]['descripcion'].toString(),fecha: list[i]['fecha'].toString(),);
        }
    );
  }






}


