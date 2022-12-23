// ignore_for_file: unused_import, prefer_const_constructors, duplicate_ignore, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'mesTables/actualite.dart';
import 'mesTables/contact.dart';
import 'mesTables/infos.dart';
import 'mesTables/signal_cas.dart';
import 'mesTables/urgence.dart';

void main() {
  runApp(const MyAccueil());
}

class MyAccueil extends StatelessWidget {
  const MyAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // title: 'sos avc',
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                // ignore: prefer_const_constructors
                icon: Icon(Icons.note_add_sharp,
                    color: Color.fromARGB(255, 6, 74, 176), size: 34.0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MySignal()),
                  );
                }),
          ],
          //Création du menu dans le appbar
          bottom: TabBar(
            isScrollable: true,
            tabs: const <Widget>[
              Tab(
                text: 'ACTUALITES',
                icon: Icon(Icons.newspaper),
              ),
              Tab(text: 'INFOS', icon: Icon(Icons.info)),
              Tab(text: 'URGENCE', icon: Icon(Icons.call)),
              Tab(text: 'CONTACTS', icon: Icon(Icons.contact_phone)),
            ],
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            MyActualite(),
            MyInfos(),
            MyUrgence(),
            MyContact(),
          ],
        ),
      ),
    );
  }
}
