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

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

     
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
