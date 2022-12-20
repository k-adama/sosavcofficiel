// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:sos_avc/mesTables/infos.dart';

void main() {
  runApp(const MySymptomes());
}

class MySymptomes extends StatelessWidget {
  const MySymptomes({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sos avc',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyMaladieSheet(title: 'SOS AVC'),
    );
  }
}

class MyMaladieSheet extends StatefulWidget {
  const MyMaladieSheet({super.key, required this.title});

  final String title;

  @override
  State<MyMaladieSheet> createState() => _MyMaladieSheetState();
}

class _MyMaladieSheetState extends State<MyMaladieSheet> {
  @override
  String text = '''Les signes d’alerte, 
Visage paralysé 
Inertie d’un membre (bras , jambes ou la moitié d’un corps )
Trouble de la parole 
En urgence, appeler le numéro urgence disponible sur l’application pour être pris en charge 
''';
  String text2 = '''Les mesures de prévention
Consulter un médecin une à deux fois par an( dépistage des facteurs de risques et les traiter ) 
Baisser la TA (objectif <135/85 mmHg )
Contrôler la glycémie (objectif < 1.1 g/L) et le cholestérol surtout le LDL 
Arrêter strictement du tabac 
Pratiquer une activité physique régulière et quotidienne sinon au moins 30 min de marche trois fois par semaine 
''';

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: new Text(
               text + text2,
                textAlign: TextAlign.justify,
                style: new TextStyle(color: Colors.black, fontSize: 30.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
