// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, sort_child_properties_last

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
  String text = '''Selon l'Organisation Mondiale de la Santé, en 2010 : 
•	17 millions de personnes ont eu un AVC dont 31% de personnes de moins de 65 ans ; 
•	6 millions de personnes dans le monde meurent d'AVC chaque année, en faisant la 2ème cause de mortalité ;
•	33 millions de personnes avaient des antécédents d'AVC ;
•	102 millions d'années de vie ont été perdues du fait d'un handicap lié à l'AVC ou un décès des suites de l'accident.
''';
  String text2 = '''Chiffres généraux de l'AVC en France 
•	En France, on estime que 150 000 personnes sont chaque année victimes d'un accident vasculaire cérébral (AVC) ; 
•	110 000 personnes sont hospitalisées chaque année ; 
•	30 000 personnes en décèdent ; 
•	Un AVC a lieu toutes les 4 minutes ;
•	On estime à 750 000 le nombre de personnes ayant survécu à un AVC ;
•	500 000 personnes présentent des séquelles. 
''';
  String text3 = '''Les séquelles de l'AVC en chiffres 
•	Un quart des personnes atteintes décèdent dans un délai relativement court ;  
•	La moitié survit mais doit faire face à des handicaps plus ou moins importants ; 
•	Un quart enfin en réchappe sans séquelles ; 
•	L'AVC est la 1ère cause de handicap acquis chez l'adulte ; 
•	C'est la 2ème cause de démence ; 
•	Il s'agit de la 2ème cause de mortalité chez l'homme, 1ère cause chez la femme. 
•	30% des victimes d'AVC souffriront de dépression. 
Le taux de mortalité à un mois est de 20 % et de 32 à 60 % à trois ans. Et 300 000 anciennes victimes d'AVC présentent aujourd'hui un handicap.
Enfin, les AVC représentent une charge financière très importante. Évaluée au Royaume-Uni, elle représente 5 % du budget annuel de la santé. 
''';
  String text4 = '''Les facteurs de risque en chiffres 
Mais de nombreux AVC pourraient être évités en réduisant certains facteurs de risque. Dix facteurs de risque sont associés à 90% des AVC :
•	L'hypertension artérielle est mise en cause dans 40% des AVC, elle multiplie le risque par 2 et par 5 chez les moins de 55 ans ; 
•	Le tabagisme : chez les fumeurs, le risque d'AVC est multiplié par 3  ;
•	L'obésité abdominale : en cause dans 36% des AVC ;
•	Une alimentation déséquilibrée : associée à 33% des AVC ; 
•	Le manque d'activité physique ; 
•	La consommation d'alcool ; 
•	La fibrillation atriale : le risque est alors multiplié par 4, elle est le premier facteur de risque d'origine cardiaque ; 
•	Les facteurs psycho-sociaux : stress, dépression et isolement social sont de facteurs de risque non négligeables ; 
•	Le diabète : il est en cause dans la survenue d'accidents vasculaires cérébraux ischémiques ; 
•	Un taux trop élevé de certains lipides dans le sang (cholestérol, triglycérides...). 
''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: new Text(
                text + text2 + text3 + text4,
                textAlign: TextAlign.justify,
                style: new TextStyle(color: Colors.black, fontSize: 25.0),
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
