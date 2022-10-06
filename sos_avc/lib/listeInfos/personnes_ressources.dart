// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new

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
            new ListTile(
              leading: Icon(Icons.person, color: Colors.cyan, size: 45),
              title: Text(
                "ADAKOU YANNICK",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              subtitle: Text("Numéro: 07 07 07 07 07"),
            ),
            SizedBox(
              height: 20,
            ),
            new ListTile(
              leading: Icon(Icons.local_hospital, color: Colors.cyan, size: 45),
              title: Text(
                "BAMBA SOULEY",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              subtitle: Text("Numéro: 01 01 01 01 01"),
            ),
            SizedBox(
              height: 20,
            ),
            new ListTile(
              leading: Icon(Icons.local_hospital, color: Colors.cyan, size: 45),
              title: Text(
                "ALAIN FRANCK",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              subtitle: Text("Numéro: 05 06 06 06 07"),
            ),
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
              builder: (context) => MyUrgence(),
            ),
          );
        },
      ),
    );
  }
}
