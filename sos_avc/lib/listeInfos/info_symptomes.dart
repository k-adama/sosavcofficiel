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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: new Text(
                "Les signes et les symptômes d’un AVC sont les mêmes pour les hommes et les femmes.Les symptômes peuvent survenir soudainement ou peuvent apparaître et disparaître pendant quelques jours. Les principaux signes avant-coureurs et symptômes d’un AVC comprennent :une faiblesse d’un seul côté de votre corps un engourdissement ou un fourmillement au niveau du visage dans les bras ou dans les jambes.",
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
