import 'package:flutter/material.dart';
import 'package:projetopdm/categorias/carnes.dart';
import 'package:projetopdm/categorias/peixe.dart';
import 'package:projetopdm/categorias/sobremesas.dart';
import 'widgets/AddRecipe.dart';
import 'main.dart';
import 'widgets/NavBar.dart';
import 'package:projetopdm/widgets/NavBar.dart';
import 'package:projetopdm/widgets/AddRecipe.dart';
import 'package:projetopdm/RecipePage.dart';
import 'categorias/entradas.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'categorias/sopas.dart';
import 'categorias/vegetariano.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Stream<List<DocumentSnapshot>> lastRecipes() {
    return FirebaseFirestore.instance
        .collection('receitas')
        .orderBy('data', descending: true)
        .limit(5)
        .snapshots()
        .map((snapshot) => snapshot.docs);
  }

  void getRecipeData(String nome) async {
    DocumentSnapshot receita =
        await FirebaseFirestore.instance.collection('receitas').doc(nome).get();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => RecipePage(
                nome: receita['nome'],
                categoria: receita['categoria'],
                tempo: receita['tempo'],
                ingredientes: receita['ingredientes'],
                preparo: receita['preparo'],
                pessoas: receita['pessoas'],
                dificuldade: receita['dificuldade'],
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas App'),
      ),
      drawer: NavBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/food.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              //title of the page
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Categorias',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //grid of categories
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(8),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Entradas()),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/Entradas.jpg',
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('Entradas',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sopas()),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/Sopas.jpg',
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('Sopas',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Carnes()),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/Carnes.jpg',
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('Carnes',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Peixe()),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/Peixe.jpg',
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('Peixe',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Vegetariano()),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/Vegetariano.jpg',
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('Vegetariano',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sobremesas()),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/Sobremesas.jpg',
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('Sobremesas',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Últimas Receitas',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 200.0,
                child: StreamBuilder<List<DocumentSnapshot>>(
                  stream: lastRecipes(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Algo deu errado');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return (ListView(
                      scrollDirection: Axis.horizontal,
                      children: snapshot.data!.map((document) {
                        return Container(
                          width: 200.0,
                          child: Card(
                            child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                getRecipeData(document['nome']);
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/' +
                                        document['categoria'] +
                                        '.jpg',
                                    width: double.infinity,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(document['nome'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddRecipe()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
