import 'dart:math';
import 'package:flutter/material.dart';
import 'campoTexto.dart';
import 'Fotos.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Projeto',
    initialRoute: '/login',
    routes: {
      '/login': (context) => PrimeiraTela(),
      '/MenuPrincipal': (context) => MenuPrincipal(),
      '/Pro1': (context) => Pro1(),
      '/Pro2': (context) => Pro2(),
      '/criador': (context) => Criador(),
    },
    //Tema
    theme: ThemeData(
      primaryColor: Colors.blue[900],
      backgroundColor: Colors.grey[100],
      fontFamily: 'Roboto', //Raleway
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 22, color: Colors.white),
        headline2: TextStyle(fontSize: 36),
        headline3: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
      ),
    ),
  ));
}

//
// MODELO DE DADOS
//quando tiver banco de dado para verificar
//
class Mensagem {
  final String senha;
  final String login;
  Mensagem(this.login, this.senha);
}

//
// TELA PRINCIPAL
//

class PrimeiraTela extends StatefulWidget {
  @override
  _PrimeiraTelaState createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  //Atributos para armazenar os valores digitados pelo usuário
  var login = TextEditingController();
  var senha = TextEditingController();

  //Atributo para identificar unicamente o formulário
  var _formId = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('logar ou cadastra',
            style: Theme.of(context).textTheme.headline1),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.delete_rounded),
              onPressed: () {
                setState(() {
                  _formId.currentState.reset();
                  senha.clear();
                  login.clear();
                  FocusScope.of(context).unfocus();
                });
              })
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            key: _formId,
            child: Column(children: [
              Icon(Icons.people_alt,
                  size: 120, color: Theme.of(context).primaryColor),
              CampoTexto('Login', login),
              CampoSenha('senha', senha),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  botao('Entra'),
                  botao('Cadrastra (a inda nao funciona)'),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  //
  // BOTÃO
  //
  Widget botao(rotulo) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: 300,
      height: 70,
      child: ElevatedButton(
        child: Text(rotulo, style: Theme.of(context).textTheme.headline1),
        onPressed: () {
          //print('botão pressionado!');

          //chamar o validador dos campos de texto
          if (_formId.currentState.validate()) {
            //O método setState é utilizado todas as vezes que é
            //necessário alterar o estado do App
            caixaDialogo('vc gostaria de entarr');
          }
        },
      ),
    );
  }

  //
  // CAIXA DE DIÁLOGO
  //
  caixaDialogo(msg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('bem vindo'),
            content: Text(msg),
            actions: [
              TextButton(
                child: Text('nao'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('sim'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/MenuPrincipal');
                },
              ),
            ],
          );
        });
  }
}

//
//menu
//

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipal createState() => _MenuPrincipal();
}

class _MenuPrincipal extends State<MenuPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu'), centerTitle: true),
      backgroundColor: Colors.grey[100],
      body: Container(
        padding: EdgeInsets.all(40),

        //
        // LISTVIEW
        //
        child: ListView(
          children: [
            Icon(Icons.list, size: 80, color: Colors.grey),
            Text(
              'Aqui no menu tera tudo que presisa saber'
              'sobre o programa e suas duvidas',
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 40),
            //projeto 1
            ListTile(
              leading: Icon(Icons.label, color: Colors.grey),
              trailing: Icon(Icons.build, color: Colors.grey),
              title: Text('primeiro porjeto',
                  style: TextStyle(fontSize: 32, color: Colors.grey)),
              subtitle: Text(
                  'seria sobre um programa pra ajudar arrumar estoque de casa' +
                      ' e ter controle das receitas',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic)),
              onTap: () {
                print('item pressionado');
                Navigator.pushNamed(context, '/Pro1');
              },
              hoverColor: Colors.blue[100],
            ),
            //projeto 2
            ListTile(
              leading: Icon(Icons.label, color: Colors.grey),
              trailing: Icon(Icons.build, color: Colors.grey),
              title: Text('projeto 2',
                  style: TextStyle(fontSize: 32, color: Colors.grey)),
              subtitle: Text(
                  'programa padrao pra ajudar a cadastrar cliente' +
                      'mais informação aqui dentro',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic)),
              onTap: () {
                print('item pressionado');
                Navigator.pushNamed(context, '/Pro2');
              },
              hoverColor: Colors.blue[100],
            ),
            //criador
            ListTile(
              leading: Icon(Icons.label, color: Colors.grey),
              trailing: Icon(Icons.build, color: Colors.grey),
              title: Text('quem crio o programa',
                  style: TextStyle(fontSize: 32, color: Colors.grey)),
              subtitle: Text(
                  'informação sobre o criador do programa e um breve' +
                      'resumo dos projeto me ajuda a escolher',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic)),
              onTap: () {
                print('item pressionado');
                Navigator.pushNamed(context, '/criador');
              },
              hoverColor: Colors.blue[100],
            ),
            //help
            ListTile(
              leading: Icon(Icons.label, color: Colors.grey),
              trailing: Icon(Icons.build, color: Colors.grey),
              title: Text('HELP',
                  style: TextStyle(fontSize: 32, color: Colors.grey)),
              subtitle: Text('esta em manutenção',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic)),
              onTap: () {
                print('item pressionado');
                Navigator.pushNamed(context, '/list2');
              },
              hoverColor: Colors.blue[100],
            ),
          ],
        ),
      ),
    );
  }
}

//
// pro1
//
class Pro1 extends StatefulWidget {
  @override
  _Pro1 createState() => _Pro1();
}

class _Pro1 extends State<Pro1> {
  //lista dinâmica simplesmente encadeada
  var lista = [];

  var txtTarefa = TextEditingController();

  @override
  void initState() {
    super.initState();
    lista.add('em resumo esse programa é para ajudar minha mae a ter ' +
        'controle de suas receitas e do estoque dentro de casa');
    lista.add('projeto 1 sera uma ARMAZEM DE RECURSO e onde compra item');
    lista.add(
        '1 janela para ujuario entra com senha  (nao que ache nessesario)');
    lista.add('2 janela para controlar item em casa e validade');
    lista.add('3 cadastrar itens e super mercado');
    lista.add('4 menu para ter controle e ir para janelas requeridas');
    lista.add(
        '5 janela de pesquisa de itens e o supermercado de onde pode compra');
    lista.add(
        '6 janela de pesquisa de iten para saber se tem ou nao item nessesario');
    lista.add('a aprtir daqui é estra que eu quero por mais n sei se vo por');
    lista.add(
        '7 cadastrar receita de comida (aqui dificil de esplicar o que quero pois é dificil)');
    lista.add(
        '8 cria um arquivo para fazer calculos de promoção necessaria no supermercado');
    lista.add('9 ver com minha mae o que ela quer e é isso por em quanto');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ONDE ESTA VC MANDITO'), centerTitle: true),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          //
          // HORIZONTAL
          //
          Container(
            padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
            height: 400,

            //
            // ListView.builder
            //
            child: ListView.builder(
              //Orientação
              scrollDirection: Axis.horizontal,

              //Aparência o item da lista
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  width: 400,
                  height: 250,
                  color: Colors.grey[300],
                  child: Center(
                      child: Text(lista[index],
                          style: Theme.of(context).textTheme.headline2)),
                );
              },

              //Quantidade de itens
              itemCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}

//
// Pro2
//
class Pro2 extends StatefulWidget {
  @override
  _Pro2 createState() => _Pro2();
}

class _Pro2 extends State<Pro2> {
  //lista dinâmica simplesmente encadeada
  var lista = [];

  var txtTarefa = TextEditingController();

  @override
  void initState() {
    super.initState();
    lista.add(
        'esse projeto seria pra ajuda minha irma no trabalho dela de veterinario' +
            ' muitos clientes as vezes esquece da vacina ou do peso entre outars coisa esse programa seria pra ajudar controla isso');
    lista.add('projeto 2 sera uma clinica veterinarica');
    lista.add('1 janela para ujuario');
    lista.add('2 janela para armazenar produto no estoque de medicamento');
    lista.add('3 cadastrar itens');
    lista.add('4 menu para andar pelo projeto');
    lista.add('5 janela de pesquisa de itens e produto da clinica');
    lista.add('6 janela de cadastrar cliente');
    lista.add('a aprtir daqui é estra que eu quero por mais n sei se vo por');
    lista.add('7 poder cadastrar cliente e o dog do cliente');
    lista.add(
        '8 criar um calendario para poder que eprmiti marcar hora e tipo de procedimento');
    lista.add(
        '9 poder salvar dados dos cliente com imagem de fotografia tirado do celular');
    lista.add('10 n tenho masi ideia vo vendo e acresento aki');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tarefas'), centerTitle: true),
      backgroundColor: Colors.grey[100],
      body: Container(
        padding: EdgeInsets.all(40),

        //
        // ListView.separeted
        //
        child: ListView.separated(
            //reverse: true,

            //Aparência do Item
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(lista[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red[100]),
                  onPressed: () {
                    setState(() {
                      lista.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Tarefa removida com sucesso.'),
                        duration: Duration(seconds: 2),
                      ));
                    });
                  },
                ),
              );
            },

            //Aparência do separador
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.red[200],
                thickness: 2,
              );
            },

            //Quantidade de itens
            itemCount: lista.length),
      ),
    );
  }
}

//
//criador
//
class Criador extends StatefulWidget {
  @override
  _Criador createState() => _Criador();
}

class _Criador extends State<Criador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('O criador', style: Theme.of(context).textTheme.headline1),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Fotos(
              'Nicholas Campanelli Abreu', 'cod: 826895', 'lib/FOTOS/eu.jpeg'),
          Comentario('professor fis codigo mais simples possivel pois tive problema  para fazer entao não' +
              'pude enfeitar muito como sempre digo faça o programa funcionar depois que tiver tudo certo,' +
              ' ai sim comessa dar um retoque na maquiagem' +
              '\n\n' +
              'Gostaria de saber qual objetivo pego, queria pergunta pra vc mais nas n consegui entra em contato com o senhor' +
              '\n\n' +
              '1- é sobre armazenar recurso, saber sua validade e onde compra o recurso ' +
              '\n\n' +
              '2- seria para ajduar os clientes a ter controle da vacina, peso e informaçao do seu proprio cachorro')
        ]),
      ),
    );
  }
}
