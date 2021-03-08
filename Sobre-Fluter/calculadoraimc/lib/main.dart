import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightControler = TextEditingController();
  TextEditingController heightControler = TextEditingController();
  String _infoText = "Informe seus dados";

  void _resetFields(){
    setState(() {
      weightControler.text="";
      heightControler.text="";
      _infoText = "Informe seus dados";
    });
  }

  void _calculate(){
    setState(() {
      double weight = double.parse(weightControler.text);
      double height = double.parse(heightControler.text)/100;
      double imc = weight/(height*height);
      if(imc<18.6){
        _infoText="Abaixo do peso(${imc.toStringAsPrecision(2)})";
      }
      else if(imc >=18.6 && imc <24.9) {
        _infoText = "Peso Ideal(${imc.toStringAsPrecision(2)})";
      }
      else if(imc >=24.9 && imc <29.9){
        _infoText="Levemente acima do peso(${imc.toStringAsPrecision(2)})";
      }
      else if(imc >=29.9 && imc <34.9){
        _infoText="Obesidade Grau 1(${imc.toStringAsPrecision(2)})";
      }
      else if(imc >=34.9 && imc <29.9){
        _infoText="Obesidade Grau 2(${imc.toStringAsPrecision(2)})";
      }
      else if(imc>=40){
        _infoText="Obesidade  Grau 3(${imc.toStringAsPrecision(2)})";
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.green,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: weightControler,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                controller: heightControler,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: _calculate,
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.green, fontSize: 25.0),
                    ),
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              )
            ],
          ),
        )); //um widget que facilita a vida para colocar outros widget do material designer
  }
}
