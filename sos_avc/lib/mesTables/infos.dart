// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/material.dart';
import 'package:sos_avc/listeInfos/info_maladie.dart';

void main() {
  runApp(const MyInfos());
}

class MyInfos extends StatelessWidget {
  const MyInfos({super.key});

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
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(
      // padding: const EdgeInsets.all(20.0),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              //Faire un border radius
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.amber,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyMaladie(),
                    ),
                  );
                },
                // splashColor: Colors.green,
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Icon(Icons.coronavirus, size: 70.0),
                    Text("C'est quoi la maladie AVC ?"),
                  ],
                )),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.amber,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                // splashColor: Colors.green,
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Icon(Icons.dangerous, size: 70.0),
                    Text("Les symptômes de l'AVC !"),
                  ],
                )),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.amber,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                // splashColor: Colors.green,
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Icon(Icons.health_and_safety, size: 70.0),
                    Text("Les mesures de préventions"),
                  ],
                )),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.amber,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                // splashColor: Colors.green,
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Icon(Icons.person_off, size: 70.0),
                    Text("Les personnes vulnérables"),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
