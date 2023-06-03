// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:sos_avc/mesTables/infos.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constant/liste.dart';


void main() {
  runApp(const MyVulnerables());
}

class MyVulnerables extends StatelessWidget {
  const MyVulnerables({super.key});

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                  Text(
                    titretext5,
                    style: TextStyle(
                      fontFamily: 'semibold',
                      fontWeight: FontWeight.w900,
                      fontSize: 25, // Remplacez la valeur ici par la taille de texte souhaitée
                      color: Colors.blue,
                    ),
                  ),
                      Text(
                        text5,
                        style: TextStyle(
                          fontFamily: 'semibold',
                          fontSize: 18, // Remplacez la valeur ici par la taille de texte souhaitée
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    Text(
                    titretext6,
                    style: TextStyle(
                      fontFamily: 'semibold',
                      fontWeight: FontWeight.w900,
                      fontSize: 25, // Remplacez la valeur ici par la taille de texte souhaitée
                      color: Colors.blue,
                    ),
                  ),
                      Text(
                        text6,
                        style: TextStyle(
                          fontFamily: 'semibold',
                          fontSize: 18, // Remplacez la valeur ici par la taille de texte souhaitée
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    Text(
                      titretext7,
                      style: TextStyle(
                        fontFamily: 'semibold',
                        fontWeight: FontWeight.w900,
                        fontSize: 25, // Remplacez la valeur ici par la taille de texte souhaitée
                        color: Colors.blue,
                      ),
                    ),
                      Text(
                        text7,
                        style: TextStyle(
                          fontFamily: 'semibold',
                          fontSize: 18, // Remplacez la valeur ici par la taille de texte souhaitée
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    Text(
                      titretext8,
                      style: TextStyle(
                        fontFamily: 'semibold',
                        fontWeight: FontWeight.w900,
                        fontSize: 25, // Remplacez la valeur ici par la taille de texte souhaitée
                        color: Colors.blue,
                      ),
                    ),
                      Text(
                        text8,
                        style: TextStyle(
                          fontFamily: 'semibold',
                          fontSize: 18, // Remplacez la valeur ici par la taille de texte souhaitée
                        ),
                        textAlign: TextAlign.justify,
                      ),
              ],
            ),
          ),

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
