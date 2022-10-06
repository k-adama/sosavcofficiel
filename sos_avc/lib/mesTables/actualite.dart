// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyActualite());
}

class MyActualite extends StatelessWidget {
  const MyActualite({super.key});

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
//debut variables
  final List<Map<String, dynamic>> _items = List.generate(
      10,
      (index) => {
            "id": index,
            "title": "Journée Nationale de lutte contre l'AVC",
            // "subtitle": "Subtitle $index"
          });

//Fin variables

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            children: ListTile.divideTiles(
                color: Colors.deepPurple,
                tiles: _items.map((item) => ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.amber,
                      backgroundImage: AssetImage('images/log_avc.png'),
                    ),
                    title: Text(item['title']),
                    // subtitle: Text(item['subtitle']),
                    onTap: () {}))).toList()));
  }
}
