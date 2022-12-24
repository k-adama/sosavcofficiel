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
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: new Text(
                " repose sur la prise en charge des facteurs de risque d'AVC.• HTA : principal facteur de risque des AVC, ischémiques ou hémorragiques :augmentation du risque relatif (RR) de 4 environ ; plus de la moitié des AVC surviennent dans un contexte d'HTA chronique.  • Tabac : RR = 2. Important facteur de risque d'athérosclérose carotidienne.• Hypercholestérolémie : RR = 1,5. Ce facteur de risque majeur de l'infarctus du myocarde est un facteur de risque plus accessoire des infarctus cérébraux• ",
                textAlign: TextAlign.justify,
                style: new TextStyle(color: Colors.black, fontSize: 28.0),
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
