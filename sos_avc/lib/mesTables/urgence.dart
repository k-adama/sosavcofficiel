// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/material.dart';

import '../listeInfos/liste_hopitaux.dart';
import '../listeInfos/personnes_ressources.dart';

void main() {
  runApp(const MyUrgence());
}

class MyUrgence extends StatelessWidget {
  const MyUrgence({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sos avc',
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
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.9,
          maxChildSize: 0.9,
          minChildSize: 0.32,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: MyListHospital(
                title: '',
              ),
            );
          }),
    );
  }
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
                child: Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          width: MediaQuery.of(context).size.width * 0.95,
          child: Card(
            semanticContainer: true,
            margin: EdgeInsets.all(10),
            elevation: 20,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.green, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            shadowColor: Colors.green[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //BLOC HOPITAL A PROXIMITE
                new ListTile(
                  leading:
                      Icon(Icons.local_hospital, color: Colors.cyan, size: 45),
                  title: Text(
                    "HÔPITAUX A PROXIMITES",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                      'Consulter la liste des hôpitaux afin de vous prendre en charge'),
                  onTap: () => _showModalBottomSheet(context),
                  //BLOC HOPITAL A PROXIMITE
                ),
              ],
            ),
          ),
        ),

        //BLOC PERSONNES RESSOURCES
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          width: MediaQuery.of(context).size.width * 0.95,
          child: Card(
            semanticContainer: true,
            margin: EdgeInsets.all(10),
            elevation: 20,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.green, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            shadowColor: Colors.green[100],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  leading: Icon(Icons.person, color: Colors.cyan, size: 45),
                  title: Text(
                    "PERSONNES RESSOURCES",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                      "Ici, la liste de personnes à contacter pour avoir plus d'informations sur vos préoccupations"),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      )),
                      builder: (context) => DraggableScrollableSheet(
                          initialChildSize: 0.9,
                          maxChildSize: 0.9,
                          minChildSize: 0.32,
                          expand: false,
                          builder: (context, scrollController) {
                            return SingleChildScrollView(
                              controller: scrollController,
                              child: MyPersRessources(
                                title: '',
                              ),
                            );
                          }),
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ],
    ))));
  }
}
