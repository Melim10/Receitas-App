import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetopdm/widgets/NavBar.dart';

import '../RecipePage.dart';

class Peixe extends StatefulWidget {
  const Peixe({super.key});

  @override
  State<Peixe> createState() => _PeixeState();
}

class _PeixeState extends State<Peixe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peixe'),
      ),
      drawer: NavBar(),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            height: 230.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Peixe.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('receitas')
                .where('categoria', isEqualTo: 'Peixe')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text('Loading...');
              } else {
                return GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.all(8),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: snapshot.data!.docs.map<Widget>((document) {
                    return Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipePage(
                                nome: document['nome'],
                                categoria: document['categoria'],
                                tempo: document['tempo'],
                                ingredientes: document['ingredientes'],
                                preparo: document['preparo'],
                                pessoas: document['pessoas'],
                                dificuldade: document['dificuldade'],
                              ),
                            ),
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
                              child: Text(
                                document['nome'],
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      )),
    );
  }
}
