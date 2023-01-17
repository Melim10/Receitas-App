import 'package:flutter/material.dart';
import 'package:projetopdm/MainPage.dart';
import 'package:projetopdm/categorias/sopas.dart';
import '../categorias/carnes.dart';
import '../categorias/entradas.dart';
import '../categorias/peixe.dart';
import '../categorias/vegetariano.dart';
import '../main.dart';
import '../categorias/sobremesas.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Container(
            child: ListTile(
              title: Text('Ínicio',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
            ),
          ),
          ListTile(
            title: Text('Entradas'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Entradas()));
            },
          ),
          ListTile(
            title: Text('Sopas'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Sopas()));
            },
          ),
          ListTile(
            title: Text('Carnes'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Carnes()));
            },
          ),
          ListTile(
            title: Text('Peixe'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Peixe()));
            },
          ),
          ListTile(
            title: Text('Vegetariano'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Vegetariano()));
            },
          ),
          ListTile(
            title: Text('Sobremesas'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Sobremesas()));
            },
          ),
        ],
      ),
    );
  }
}
