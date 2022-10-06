// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/material.dart';
import 'package:sos_avc/mesTables/infos.dart';

void main() {
  runApp(const MyVulnerables());
}

class MyVulnerables extends StatelessWidget {
  const MyVulnerables({super.key});

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
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: 
              new Text(
                "L'âge, l'hypertension artérielle, le diabète, l'inactivité physique ou le tabac sont connus pour être des facteurs de risque d’un AVC, aussi bien pour les hommes que les femmes. Mais celles-ci présentent des facteurs de risques supplémentaires qui leur sont propres. Il y a tout d’abord leur vie hormonale, mais aussi le fait qu’elles vivent plus longtemps que les hommes (alors que le risque de survenue d’un AVC augmente avec l’âge). C’est ce qui ressort d’un article de l'Association américaine du cœur paru dans la revue scientifiqueStrokeen ce début d’année. Le Dr Sztajzel le confirme: «Les femmes sont toujours plus nombreuses à être atteintes d’un accident vasculaire cérébral. En 20 ans, le nombre de nouveaux cas a doublé et il a plus augmenté chez les femmes que chez les hommes».",
               textAlign: TextAlign.justify,
               style: new TextStyle(
                color: Colors.black,
                fontSize: 25.0
               ),
              ),
              
            )
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
