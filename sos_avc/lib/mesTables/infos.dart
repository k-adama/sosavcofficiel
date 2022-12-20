// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:sos_avc/listeInfos/info_maladie.dart';
import 'package:sos_avc/listeInfos/info_mesures.dart';
import 'package:sos_avc/listeInfos/info_symptomes.dart';
import 'package:sos_avc/listeInfos/vulnerables.dart';
import 'package:sos_avc/listeInfos/protocoles.dart';


void main() {
  runApp(const MyInfos());
}

class MyInfos extends StatelessWidget {
  const MyInfos({super.key});

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
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,
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
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.coronavirus, size: 70.0),
                    Text("Qu'est ce que l' AVC ?"),
                  ],
                )),
              ),
            ),

            //Bloc symptômes
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MySymptomes(),
                    ),
                  );
                },
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.dangerous, size: 70.0),
                    Text("Les séquelles de l'AVC !"),
                  ],
                )),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyMesuresPreventives(),
                    ),
                  );
                },
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.health_and_safety, size: 70.0),
                    Text("Les signes d'alertes et les  mesures de preventions de l'avc"),
                  ],
                )),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyVulnerables(),
                    ),
                  );
                },
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.person_off, size: 70.0),
                    Text("AVC dans le monde : les chiffres "),
                  ],
                )),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Protocole(),
                    ),
                  );
                },
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.coronavirus, size: 70.0),
                    Text("Protocole"),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
