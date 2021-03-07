import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home:Home()
  ));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;//inicalizo variavel mas nn quero que ninguem acesse ela de fora da classe
  String _lotadoOuNao="Pode entrar!";
  void _changePeople(int delta){
    setState(() {//informar que o que vai estar dentro dele Mudará de estado
      _people+=delta;
      if(_people>10){
        _lotadoOuNao="Lotado!";
      }
      else if(_people<0){
        _lotadoOuNao  ="invertido, Falencia?";
      }
      else{
        _lotadoOuNao  ="Pode entrar!";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/restaurant.jpg",fit: BoxFit.cover,height: 1000.0,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoa:$_people",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(child: Text("+1",style: TextStyle(fontSize: 40,color: Colors.white)),onPressed: (){
                    _changePeople(1);
                  },),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(child: Text("-1",style: TextStyle(fontSize: 40,color: Colors.white)),onPressed: (){
                    _changePeople(-1);
                  },),
                ),
              ],
            ),
            Text(
              _lotadoOuNao,
              style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );


  }
}
