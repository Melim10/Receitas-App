import 'package:flutter/material.dart';
import 'MainPage.dart';
import 'widgets/NavBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipePage extends StatelessWidget {
  final String nome;
  final String categoria;
  final String tempo;
  final String ingredientes;
  final String preparo;
  final String pessoas;
  final String dificuldade;

  const RecipePage(
      {required this.nome,
      required this.categoria,
      required this.tempo,
      required this.ingredientes,
      required this.preparo,
      required this.pessoas,
      required this.dificuldade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nome),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/images/food.jpg',
              height: 240,
              width: 600,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Caracteristicas',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.people_alt),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Text(
                          pessoas + ' pessoas',
                        ),
                      ),
                      SizedBox(width: 50.0),
                      Icon(Icons.food_bank),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Text(
                          categoria,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.timer),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Text(
                          tempo + ' min',
                        ),
                      ),
                      SizedBox(width: 50.0),
                      Icon(Icons.star),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Text(
                          dificuldade,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Ingredientes',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(ingredientes),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Preparo',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(preparo),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
