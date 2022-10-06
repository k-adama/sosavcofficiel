// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/material.dart';
import 'package:sos_avc/mesTables/infos.dart';

void main() {
  runApp(const MyMaladie());
}

class MyMaladie extends StatelessWidget {
  const MyMaladie({super.key});

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
              child: 
              new Text(
                "Les accidents vasculaires cérébraux (AVC) sont caractérisés par la survenue brutale d'un déficit neurologique focal. Ils affectent environ 150000 patients par an, un nombre qui a tendance à augmenter en raison de l'augmentation de la population et de son vieillissement Environ un quart des AVC sont des récidives survenant chez des patients ayant unantécédent cérébrovasculaire. Les AVC peuvent survenir à tout âge, y compris dans l'enfance, mais, dans 75 %des cas, il affecte des patients âgés de plus de 65 ans. L'âge moyen de survenue d'un AVC est de 73 ans (70 ans pour les hommes et 76 ans pour les femmes)",
               textAlign: TextAlign.justify,
               style: new TextStyle(
                color: Colors.black,
                fontSize: 17.0
               ),
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
              builder: (context) => MyInfos(),
            ),
          );
        },
      ),
    );
  }
}
