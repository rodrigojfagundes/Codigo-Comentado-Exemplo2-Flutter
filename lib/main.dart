// CALCULADORA

//Nesta versão da calculadora eu removi o que eu considero MENOS IMPORTANTE,
//E ao remover essas coisas eu acredito que ficou MAIS FACIL entender o funcionamento do
// CODIGO
//
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
  // Declarando as variaveis
  TextEditingController numUmController = TextEditingController();
  TextEditingController numDoisController = TextEditingController();
  TextEditingController numTresController = TextEditingController();

  // acho que é os botoes tipo +, -, *, /
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //variavel _resultado vai receber os dados da operacao feita com os valores das variaveis NumUm, NumDois, NumTres
  String _resultadoCalculadora = "Resultado: ";

//ao apertar no X q tem no TOPBAR é reiniciado os valores da calculadora... Zerando os valores das variaveis
  void _limpaCampos() {
    setState(() {
      numUmController.text = "";
      numDoisController.text = "";
      numTresController.text = "";
      //passando o valor de RESULTADO q no caso comeca com o valor 0
      _resultadoCalculadora = "Resultado: ";
    });
  }

//funcao calcular recebe o valor de UMA OPERACAO no formato INT
  void calcular(int operacao) {
    setState(() {
      //pegando o valor q ta nos campos EX double.parse(numUmController.text); e movendo para as variaveis DOUBLE numUm... etc..
      double numUm = double.parse(numUmController.text);
      double numDois = double.parse(numDoisController.text);
      double numTres = double.parse(numTresController.text);

//variavel RESULTADO COMECA COM 0
      double resultado = 0;

//dependendo de qual BOTAO/OPCAO o usuario clicar... vai ser uma dessas alternativas...
//tipo botao de + é opcao 1, botao de - opcao 2, botao de * é opcao 3 e / é opcao 4
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
//passando o resultado das OP acima para a variavel resultado...
      _resultadoCalculadora = "" + resultado.toStringAsPrecision(3);
    });
  }

//carregando mais a parte de design do app
  @override
  //criando um widget de construcao
  Widget build(BuildContext context) {
    //criando o esqueleto, com um appBar escrito calculadora... TopBar cor Verde e um botao de RESET em cima
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora"),
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.clear),
              //ao ser precionado o botao chamaa funcao _LIMPA CAMPOS
              onPressed: _limpaCampos,
            )
          ],
        ),
        //
        //
        //ACHO Q daqui a baixo cria o design do corpo do APP
        body: SingleChildScrollView(
          //ACHO Q aqui ta dizendo q vamos criar um formulario (campos, colunas, etc..)
          child: Form(
            //eu acho q tem haver com o botao q eu apertar tipo +, -, *, /... e armazenado nele
            key: _formKey,
            child: Column(
              //LOGO / IMAGEM q fica em cima no APP
              children: <Widget>[
                Icon(Icons.confirmation_number,
                    size: 120.0, color: Colors.green),
                //
                //
                //criando um FIELD(CAMPO) para add um numero e SALVAR na variavel NumUm
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Primeiro Numero",
                  ),
                  //alinhando o numero digitado no campo no centro do campo
                  textAlign: TextAlign.center,
                  //armazenando o valor digitado no campo, na variavel numUm
                  controller: numUmController,
                ),
                //
                //
                //criando o segundo campo para digitar o numero
                TextFormField(
                  //campo só aceita valores numericos
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Segundo Numero",
                  ),
                  //centralizando o numero digitado
                  textAlign: TextAlign.center,
                  //armazenando os valores digitado no CAMPO na variavel numDois
                  controller: numDoisController,
                ),
                //
                //
                //terceiro campo para digitar numero
                TextFormField(
                  //campo tambem só aceita valores numericos... por causa do .number
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "terceiro Numero",
                  ),
                  //centralizando os valores digitados no centro do campo
                  textAlign: TextAlign.center,
                  //armazenando os valores digitados na variavel numTres
                  controller: numTresController,
                ),
                //
                //
                //Criando os botoes das operacoes +, -, *, /... em LINHA
                Row(
                  //criando um widget (q sera um botao)
                  children: <Widget>[
                    RaisedButton(
                      //se o botao for precionadoo... e passado o valor 1 para funcao calcular
                      //valor 1 representa SOMAR
                      onPressed: () {
                        //passando valor 1 parafuncao calcular
                        calcular(1);
                      },
                      //texto q vai aparecer no botao... no caso o + SOMAR
                      child: Text(
                        "+",
                      ),
                      //cor do botao verde
                      color: Colors.green,
                    ),
                    //
                    //criando botao
                    RaisedButton(
                      onPressed: () {
                        //ao ser precionado ele passa o numero 2 para funcao calcular...
                        //numero 2 significa - menos
                        calcular(2);
                      },
                      //texto q aparece no botao
                      child: Text(
                        "-",
                      ),
                      //cor do botao
                      color: Colors.green,
                    ),
                    //
                    //criando novo botao
                    RaisedButton(
                      //ao ser apertado ele passa o valor 3
                      onPressed: () {
                        //valor 3 para a funcao calcular... valor 3 representa MULTIPLICACAO
                        calcular(3);
                      },
                      //TEXTO do BOTAO...
                      child: Text(
                        "*",
                      ),
                      //cor verde para o botao
                      color: Colors.green,
                    ),
                    //
                    //criando botao 4
                    RaisedButton(
                      onPressed: () {
                        //ao ser precionado e passado o valor 4 para funcao calcular
                        calcular(4);
                      }, //texto do botao é / ou seja dividir
                      child: Text(
                        "/",
                      ),
                      color: Colors.green,
                    ),
                  ],
                ),
                //campo text para exibir o resultado
                Text(
                  _resultadoCalculadora,
                  //centralizando o resultado
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
