// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_import, unnecessary_new, unused_field, prefer_final_fields, unnecessary_const
import 'package:flutter/material.dart';
import 'package:sos_avc/mesTables/actualite.dart';
import 'package:sos_avc/mesTables/contact.dart';
import 'package:sos_avc/mesTables/infos.dart';
import 'package:sos_avc/mesTables/signal_cas.dart';
import 'package:sos_avc/mesTables/urgence.dart';
import 'package:sos_avc/option.dart';

void main() {
  runApp(const MyAccueil());
}

class MyAccueil extends StatelessWidget {
  const MyAccueil({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // title: 'sos avc',
      // theme: ThemeData(
      //   primarySwatch: Colors.lightGreen,
      // ),
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
  // TabController _tabController = TabController(length: 4, vsync: this);
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                icon: Icon(Icons.add_alert_rounded,
                    color: const Color(0xFF00FF00), size: 34.0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MySignal()),
                  );
                }),
          ],
          //Création du menu dans le appbar
          bottom: TabBar(
            // controller: _tabController,
            //Permet de faire scroller le menu
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
          // controller: _tabController,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            MyActualite(),
            MyInfos(),
            MyUrgence(),
            MyContact(),
          ],
        ),
      ),
    );

    // floatingActionButton: FloatingActionButton(
    //   onPressed: _incrementCounter,
    //   tooltip: 'Increment',
    //   child: const Icon(Icons.add),
    // ), // This trailing comma makes auto-formatting nicer for build methods.
  }
}
