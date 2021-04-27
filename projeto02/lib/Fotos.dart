
import 'package:flutter/material.dart';

class Fotos extends StatelessWidget {
  final String foto;
  final String nome;
  final String cod;

 Fotos(this.nome,this.cod,this.foto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 200,

      //margin
      //margin: EdgeInsets.all(20),
      //margin: EdgeInsets.symmetric(horizontal: 20),
      //margin: EdgeInsets.symmetric(vertical: 20),
      //margin: EdgeInsets.only(left: 30),
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),

      //espaçamento
      padding: EdgeInsets.all(20),

      //borda
      decoration: BoxDecoration(
          color: Colors.grey[400],
          border: Border.all(
            color: Colors.grey[600],    
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10)
            ),
          gradient: LinearGradient(
              colors: [Colors.grey[400], 
              Colors.white, 
              Colors.grey[400]
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
              )
            ),

      child: Column(
        children: [
          Text(nome, style: Theme.of(context).textTheme.headline2),
          Text(cod, style: Theme.of(context).textTheme.headline3),
          Image.asset(foto)
        ],
      ),
    );
  }
}

class Comentario extends StatelessWidget {
  final String comen;

 Comentario(this.comen);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 200,

      //margin
      //margin: EdgeInsets.all(20),
      //margin: EdgeInsets.symmetric(horizontal: 20),
      //margin: EdgeInsets.symmetric(vertical: 20),
      //margin: EdgeInsets.only(left: 30),
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),

      //espaçamento
      padding: EdgeInsets.all(20),

      //borda
      decoration: BoxDecoration(
          color: Colors.grey[400],
          border: Border.all(
            color: Colors.grey[600],    
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10)
            ),
          gradient: LinearGradient(
              colors: [Colors.grey[400], 
              Colors.white, 
              Colors.grey[400]
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
              )
            ),

      child: Column(
        children: [
           Text(comen, style: Theme.of(context).textTheme.headline2),
        ],
      ),
    );
  }
}