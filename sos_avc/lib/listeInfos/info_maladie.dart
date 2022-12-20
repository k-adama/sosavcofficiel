// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:sos_avc/mesTables/infos.dart';

void main() {
  runApp(const MyMaladie());
}

class MyMaladie extends StatelessWidget {
  const MyMaladie({super.key});

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
  String text = ''' Les différents types d'AVC 
Il existe deux types d'AVC : ischémiques (provoqués par l'obstruction d'un vaisseau sanguin par un caillot) ou hémorragiques (provoqués par une hémorragie).
AVC ischémique

AVC hémorragique
Il est ici question de la rupture d'un vaisseau, entraînant une  hémorragie. Le sang se répand et endommage le tissu cérébral alentour. La localisation et la grosseur de l'hématome déterminent sa gravité. On parle dans ce cas d'AVC hémorragique, d'hémorragie cérébrale ou d'hématome cérébral.
•On estime que 20% des AVC sont de nature hémorragique. 
 Les conséquences des AVC dépendent de nombreux facteurs : la vitesse de rétablissement de la circulation sanguine, la durée de la privation en oxygène et la localisation cérébrale de l'accident.
''';
String text2 = '''Il s'agit de l'obstruction d'un vaisseau sanguin par un caillot, réduisant l'irrigation sanguine dans une zone cérébrale. Le caillot peut se former localement dans une petite artère ou venir du coeur ou d'une lésion de la paroi d'une des grosses artères cervicales (artères carotides et vertébrales). On parle alors d'AVC ischémique. Plus de 80 % des AVC sont de nature ischémique.''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: new Text(
                text+ text2,
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
