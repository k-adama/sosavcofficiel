// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import, unnecessary_new, unused_field, prefer_final_fields, unnecessary_const
import 'package:flutter/material.dart';
import 'package:sos_avc/accueil.dart';
import 'package:sos_avc/mesTables/actualite.dart';
import 'package:sos_avc/mesTables/infos.dart';
import 'package:sos_avc/mesTables/signal_formulaire.dart';

void main() {
  runApp(const MySignal());
}

class MySignal extends StatelessWidget {
  const MySignal({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'sos avc',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'SOS AVC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          //Bouton retour
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyAccueil()),
              );
            },
          ),
          automaticallyImplyLeading: false,
          //Création du menu dans le appbar
          bottom: TabBar(
            //Permet de faire scroller le menu
            isScrollable: true,
            tabs: const <Widget>[
              Tab(
                  text: 'ENREGISTRER UN CAS',
                  icon: Icon(Icons.health_and_safety)),
              Tab(text: 'HISTRORIQUE', icon: Icon(Icons.history)),
            ],
          ),
        ),
        body: new TabBarView(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            MySignalForm(),
            MyInfos(),
          ],
        ),
      ),
    );
  }
}
