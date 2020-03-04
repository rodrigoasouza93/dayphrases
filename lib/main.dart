import 'dart:math';

import 'package:flutter/material.dart';

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
  final List<String> _frases = [
    "A persistência é o caminho do êxito.",
    "O sucesso nasce do querer, da determinação e persistência em se chegar a um objetivo. Mesmo não atingindo o alvo, quem busca e vence obstáculos, no mínimo fará coisas admiráveis.",
    "Lute. Acredite. Conquiste. Perca. Deseje. Espere. Alcance. Invada. Caia. Seja tudo o quiser ser, mas acima de tudo, seja você sempre.",
    "Só existe um êxito: a capacidade de levar a vida que se quer.",
    "A coragem não é ausência do medo; é a persistência apesar do medo.",
  ];

  String _fraseGerada = "Clique abaixo para gerar uma frase!";
  int numeroSorteado;

  void _gerarFrase() {
    int aux = Random().nextInt(_frases.length);
    while (numeroSorteado == aux) {
      aux = Random().nextInt(_frases.length);
    }
    setState(() {
      numeroSorteado = aux;
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset("assets/images/logo.png"),
              Text(
                _fraseGerada,
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              RaisedButton(
                color: Colors.green,
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: _gerarFrase,
              )
            ],
          ),
        ),
      ),
    );
  }
}
