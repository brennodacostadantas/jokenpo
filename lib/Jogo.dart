import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imageApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void opcaoSelecionada(String escolhaUsuario) {
    var _opcoes = ["pedra", "papel", "tesoura"];
    var _numeroAleatorio = Random().nextInt(3);
    var _escolhaApp = _opcoes[_numeroAleatorio];

    switch (_escolhaApp) {
      case "pedra":
        setState(() {
          _imageApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imageApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imageApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && _escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && _escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && _escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou :)";
      });
    } else if ((_escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (_escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (_escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this._mensagem = "Você perdeu! :(";
      });
    } else {
      setState(() {
        this._mensagem = "Empatamos ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(
            image: this._imageApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => opcaoSelecionada("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                  onTap: () => opcaoSelecionada("papel"),
                  child: Image.asset(
                    "images/papel.png",
                    height: 100,
                  )),
              GestureDetector(
                  onTap: () => opcaoSelecionada("tesoura"),
                  child: Image.asset(
                    "images/tesoura.png",
                    height: 100,
                  )),
              /*Image.asset(
                "images/pedra.png",
                height: 100,
              ),
              Image.asset(
                "images/papel.png",
                height: 100,
              ),
              Image.asset(
                "images/tesoura.png",
                height: 100,
              ),*/
            ],
          )
        ],
      ),
    );
  }
}
