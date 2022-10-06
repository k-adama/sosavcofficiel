// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:sos_avc/mesTables/urgence.dart';

void main() {
  runApp(const MyListHopital());
}

class MyListHopital extends StatelessWidget {
  const MyListHopital({super.key});

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
              leading: Icon(Icons.local_hospital, color: Colors.cyan, size: 45),
              title: Text(
                "CHU COCODY ANGRE / Abidjan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              subtitle: Text("Numéro: 0000000"),
            ),
            SizedBox(
              height: 20,
            ),
            new ListTile(
              leading: Icon(Icons.local_hospital, color: Colors.cyan, size: 45),
              title: Text(
                "HOPITAL D'ICI ET D'AILLEURS / Yopougon",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              subtitle: Text("Numéro: 0000000"),
            ),
            SizedBox(
              height: 20,
            ),
            new ListTile(
              leading: Icon(Icons.local_hospital, color: Colors.cyan, size: 45),
              title: Text(
                "HOPITAL D'ICI ET D'AILLEURS / Yopougon",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              subtitle: Text("Numéro: 0000000"),
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
