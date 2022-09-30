// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables

            children: <Widget>[
              //1e box
              Expanded(
                  child: SizedBox(
                width: 150,
                height: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      side: BorderSide(
                        width: 5.0,
                        color: Colors.grey,
                      )),
                  child: Text(
                    '''C'est quoi la maladie AVC ?''',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  onPressed: () {},
                ),
              )),
              //Créer espace entre les deux box
              Container(width: 10, color: Colors.transparent),

              //2e box
              Expanded(
                  child: SizedBox(
                width: 150,
                height: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      side: BorderSide(
                        width: 5.0,
                        color: Colors.grey,
                      )),
                  child: Text(
                    'SE CONNECTER',
                  ),
                  onPressed: () {},
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
