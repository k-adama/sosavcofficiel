// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:sos_avc/mesTables/urgence.dart';

void main() {
  runApp(const MyPersonneRessource());
}

class MyPersonneRessource extends StatelessWidget {
  const MyPersonneRessource({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sos avc',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyPersRessources(title: 'SOS AVC'),
    );
  }
}

class MyPersRessources extends StatefulWidget {
  const MyPersRessources({super.key, required this.title});

  final String title;

  @override
  State<MyPersRessources> createState() => _MyPersRessourcesState();
}

class _MyPersRessourcesState extends State<MyPersRessources> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          new ListTile(
            leading: Icon(Icons.person, color: Colors.cyan, size: 45),
            title: Text(
              "ADAKOU YANNICK",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            subtitle: Text("Numéro: 07 07 07 07 07"),
          ),
          new ListTile(
            leading: Icon(Icons.person, color: Colors.cyan, size: 45),
            title: Text(
              "BAMBA SOULEY",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            subtitle: Text("Numéro: 01 01 01 01 01"),
          ),
          new ListTile(
            leading: Icon(Icons.person, color: Colors.cyan, size: 45),
            title: Text(
              "ALAIN FRANCK",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            subtitle: Text("Numéro: 05 06 06 06 07"),
          ),
          new ListTile(
            leading: Icon(Icons.person, color: Colors.cyan, size: 45),
            title: Text(
              "KOUASSI JULES",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            subtitle: Text("Numéro: 05 06 06 06 07"),
          ),
          new ListTile(
            leading: Icon(Icons.person, color: Colors.cyan, size: 45),
            title: Text(
              "AMADOU SOW",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            subtitle: Text("Numéro: 05 06 06 06 07"),
          ),
        ],
      ),
    );
  }
}
