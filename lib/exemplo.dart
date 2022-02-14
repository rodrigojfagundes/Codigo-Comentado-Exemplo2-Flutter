//    Calculadora QUASE ORIGINAL... Eu apenas acresentei o TERCEIRO CAMPO para fazer calculo...
//    Antigamente era possivel fazer calculo com 2 numeros só tipo (2 + 2) agora podemos fazer (2 + 2 + 2)
//    mas de restante o codigo esta original... Ouve algumas pequenas alterações para fazer o codigo funcionar
//    nesta versão do Flutter
//

// ignore_for_file: prefer_const_constructors

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
  // Calculadora
  TextEditingController numUmController = TextEditingController();
  TextEditingController numDoisController = TextEditingController();
  TextEditingController numTresController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _resultadoCalculadora = "Resultado: ";

  void _limpaCampos() {
    setState(() {
      numUmController.text = "";
      numDoisController.text = "";
      numTresController.text = "";
      _resultadoCalculadora = "Resultado: ";
    });
  }

  void calcular(int operacao) {
    setState(() {
      double numUm = double.parse(numUmController.text);
      double numDois = double.parse(numDoisController.text);
      double numTres = double.parse(numTresController.text);

      double resultado = 0;

      switch (operacao) {
        case 1:
          resultado = numUm + numDois + numTres;
          break;
        case 2:
          resultado = numUm - numDois - numTres;
          break;
        case 3:
          resultado = numUm * numDois * numTres;
          break;
        case 4:
          resultado = numUm / numDois / numTres;
          break;
      }

      _resultadoCalculadora = "" + resultado.toStringAsPrecision(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: _limpaCampos,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.confirmation_number,
                    size: 120.0, color: Colors.green),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Primeiro Numero",
                      labelStyle: TextStyle(color: Colors.green)),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                  ),
                  controller: numUmController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira o numero";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Segundo Numero",
                      labelStyle: TextStyle(color: Colors.green)),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                  ),
                  controller: numDoisController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira o numero";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "terceiro Numero",
                      labelStyle: TextStyle(color: Colors.green)),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                  ),
                  controller: numTresController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira o numero";
                    }
                  },
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          calcular(1);
                        }
                      },
                      child: Text(
                        "+",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      color: Colors.green,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          calcular(2);
                        }
                      },
                      child: Text(
                        "-",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      color: Colors.green,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          calcular(3);
                        }
                      },
                      // ignore: prefer_const_constructors
                      child: Text(
                        "*",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      color: Colors.green,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          calcular(4);
                        }
                      },
                      child: Text(
                        "/",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      color: Colors.green,
                    ),
                  ],
                ),
                Text(
                  _resultadoCalculadora,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 20.0),
                ),
              ],
            ),
          ),
        ));
  }
}
