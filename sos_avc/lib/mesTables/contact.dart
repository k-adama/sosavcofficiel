// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(const MyContact());
}

class MyContact extends StatelessWidget {
  const MyContact({super.key});

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Image.asset(
                'images/log_avc.png',
                height: 120,
                width: 120,
              ),
              //Siege social
              ListTile(
                leading: Icon(Icons.house),
                title: Text(
                  'SIEGE SOCIAL :',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                subtitle: Text('''Abidjan Riviéra Golf, Immeuble Agnéby'''),
              ),
              //Adresse
              ListTile(
                leading: Icon(Icons.my_location),
                title: Text(
                  'ADRESSE POSTALE :',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                subtitle: Text('05 BP 1883 Abidjan 05'),
              ),
              //Contacts
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  'CONTACTS :',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                subtitle: Text('(+225) 07 68 29 81 70 / 01 02 32 96 96'),
              ),

              //E-mail
              ListTile(
                leading: Icon(Icons.email),
                title: Text(
                  'ADRESSE E-MAIL :',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                subtitle: Text('ongavcespoir2018@gmail.com'),
              ),

              //Site web
              ListTile(
                leading: Icon(Icons.email),
                title: Text(
                  'SITE WEB :',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                subtitle: Text('www.avcespoir.net'),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
