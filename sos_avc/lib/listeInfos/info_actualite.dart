// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, sort_child_properties_last, unused_import

import 'package:flutter/material.dart';

import '../mesTables/infos.dart';

import '../mesTables/actualite.dart';

void main() {
  runApp(const MyInfoActualite());
}

class MyInfoActualite extends StatelessWidget {
  const MyInfoActualite({super.key});

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
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: new Text(
                "Comme chaque année, à l’occasion de la journée Mondial de lutte contre les AVC, l’ONG AVC ESPOIR lance des démarches pour l’organisation de la 3e édition:<<AVC:Informer pour prévenir>>.En côte d’ivoire avec en moyenne 35% des hospitalisations, les AVC représentent aujourd’hui le 1er mootif d’admission en mèdecine intern. Face à cet tableau sombre, l’ONG AVC ESpoir a lancé ses activité avec pour principale ",
                textAlign: TextAlign.justify,
                style: new TextStyle(color: Colors.black, fontSize: 28.0),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyActualite(),
            ),
          );
        },
      ),
    );
  }
}
