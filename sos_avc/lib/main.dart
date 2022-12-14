import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sos_avc/accueil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'bienvenu.dart';
import 'option.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  //Debut variables
  final call = Uri.parse('tel:112');
  var idMalade;
  //Fin variables

  //Debut function
  Future<void> requiredId() async {
    final prefs =
        await SharedPreferences.getInstance(); //sharedpreference instence

    //get code MALADE
    setState(() {
      idMalade = prefs.getString('idMalade');
      print(idMalade);
    });
  }
  //Fin function

  @override
  void initState() {
    requiredId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Image.asset(
              'images/log_avc.png',
              height: 200,
              width: 200,
            ),
            Container(
              child: Text("BIENVENUE SUR AVC ESPOIR..."), 
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.limeAccent[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(300, 60),
                  ),
                  onPressed: () {
                    idMalade == null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyOption(),
                            ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyAccueil(),
                            ),
                          );
                  },
                  icon: Icon(Icons.start),
                  label: Text("DEMARRER")),
            ),
            SizedBox(
              height: 20.0,
            ),
            //Bouton d'appel au centre
            Container(
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(174, 234, 0, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(300, 60),
                  ),
                  onPressed: () async {
                    if (await canLaunchUrl(call)) {
                      launchUrl(call);
                    } else {
                      throw 'Impossible de joinde $call';
                    }
                  },
                  icon: Icon(Icons.phone),
                  label: Text("APPEL D'URGENCE")),
            )
          ],
        ),
      ),
    );
  }
}
