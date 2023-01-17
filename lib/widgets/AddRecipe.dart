import 'package:flutter/material.dart';
import 'package:projetopdm/MainPage.dart';
import 'NavBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final nome = TextEditingController();
  final pessoas = TextEditingController();
  final tempo = TextEditingController();
  String _dificuldade = '';
  String _categoria = '';
  final ingredientes = TextEditingController();
  final preparo = TextEditingController();

  void addRecipe() {
    if (nome.text.isNotEmpty &&
        pessoas.text.isNotEmpty &&
        tempo.text.isNotEmpty &&
        _dificuldade.isNotEmpty &&
        _categoria.isNotEmpty &&
        ingredientes.text.isNotEmpty &&
        preparo.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('receitas').doc(nome.text).set({
        'nome': nome.text,
        'pessoas': pessoas.text,
        'tempo': tempo.text,
        'dificuldade': _dificuldade,
        'categoria': _categoria,
        'ingredientes': ingredientes.text,
        'preparo': preparo.text,
        'data': DateTime.now().toString(),
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Erro'),
            content: const Text('Preencha todos os campos'),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Receita'),
      ),
      drawer: NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: nome,
              decoration: const InputDecoration(
                icon: Icon(Icons.restaurant),
                hintText: 'Nome da Receita',
                labelText: 'Nome da Receita',
              ),
            ),
            Container(
              child: Column(
                children: [
                  //number of people
                  TextFormField(
                    controller: pessoas,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.people),
                      hintText: 'Número de Pessoas',
                      labelText: 'Número de Pessoas',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: tempo,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.timer),
                      hintText: 'Tempo de Preparo (minutos)',
                      labelText: 'Tempo de Preparo (minutos)',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      hintText: 'Categoria',
                      icon: Icon(Icons.category),
                    ),
                    value: _categoria.isNotEmpty ? _categoria : null,
                    onChanged: (String? newValue) {
                      setState(() {
                        _categoria = newValue!;
                      });
                    },
                    items: <String>[
                      'Entradas',
                      'Sopas',
                      'Carnes',
                      'Peixe',
                      'Vegetariano',
                      'Sobremesas'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      hintText: 'Dificuldade',
                      icon: Icon(Icons.category),
                    ),
                    value: _dificuldade.isNotEmpty ? _dificuldade : null,
                    onChanged: (String? newValue) {
                      setState(() {
                        _dificuldade = newValue!;
                      });
                    },
                    items: <String>['Fácil', 'Médio', 'Difícil']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Container(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: ingredientes,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.food_bank),
                            hintText: 'Ingredientes',
                            labelText: 'Ingredientes',
                            alignLabelWithHint: true,
                          ),
                          maxLines: 5,
                        ),
                        TextFormField(
                          controller: preparo,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.food_bank),
                            hintText: 'Preparo',
                            labelText: 'Preparo',
                            alignLabelWithHint: true,
                          ),
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addRecipe();
              },
              child: Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
