// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:sos_avc/accueil.dart';
import 'package:sos_avc/accueil_non_patient.dart';
import 'package:sos_avc/login.dart';
import 'package:sos_avc/main.dart';

void main() {
  runApp(const MyOption());
}

class MyOption extends StatelessWidget {
  const MyOption({super.key});

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
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        //Bouton retour
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Image.asset(
              'images/log_avc.png',
              height: 280,
              width: 280,
            ),
            Container(
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.limeAccent[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(300, 60),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePageLogin(
                          title: '',
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.local_hospital),
                  label: Text("PATIENT")),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellowAccent[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(300, 60),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyAccueilNonPatient(),
                      ),
                    );
                  },
                  icon: Icon(Icons.verified_user_sharp),
                  label: Text("NON PATIENT")),
            )
          ],
        ),
      ),
    );
  }
}
