// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:sos_avc/mesTables/infos.dart';

void main() {
  runApp(const MyMesuresPreventives());
}

class MyMesuresPreventives extends StatelessWidget {
  const MyMesuresPreventives({super.key});

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "LES MESURES DE PREVENTIONS",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: Colors.blueAccent),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: height * 0.18,
                      width: width * 0.95,
                      child: Card(
                        semanticContainer: true,
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        shadowColor: Colors.green[100],
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            //VISAGE PARALYSE
                            ListTile(
                              leading: Icon(Icons.check_box_sharp,
                                  color: Colors.green, size: 45),
                              title: Text(
                                "Consulter un médecin une à deux fois par an( dépistage des facteurs de risques et les traiter )",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),

                              //
                            ),
                          ],
                        ),
                      ),
                    ),
                    //
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Card(
                        semanticContainer: true,
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        shadowColor: Colors.green[100],
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            //
                            ListTile(
                              contentPadding:
                                  EdgeInsets.only(top: 25, left: 15),
                              leading: Icon(Icons.check_box_sharp,
                                  color: Colors.green, size: 45),
                              title: Text(
                                "Baisser la TA (objectif <135/85 mmHg )",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //SPORT
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Card(
                        semanticContainer: true,
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        shadowColor: Colors.green[100],
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            //
                            ListTile(
                              leading: Icon(Icons.check_box_sharp,
                                  color: Colors.green, size: 45),
                              title: Text(
                                "Pratiquer une activité physique régulière et quotidienne sinon au moins 30 min de marche trois fois par semaine",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Card(
                        semanticContainer: true,
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        shadowColor: Colors.green[100],
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            //
                            ListTile(
                              contentPadding:
                                  EdgeInsets.only(top: 15, left: 13),
                              leading: Icon(Icons.check_box_sharp,
                                  color: Colors.green, size: 45),
                              title: Text(
                                "Contrôler la glycémie \n(objectif < 1.1 g/L) et le cholestérol surtout le LDL",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //TABAC
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Card(
                        semanticContainer: true,
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        shadowColor: Colors.green[100],
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            //
                            ListTile(
                              contentPadding:
                                  EdgeInsets.only(top: 25, left: 15),
                              leading: Icon(Icons.check_box_sharp,
                                  color: Colors.green, size: 45),
                              title: Text(
                                "Arrêter strictement du tabac",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
              builder: (context) => MyInfos(),
            ),
          );
        },
      ),
    );
  }
}
