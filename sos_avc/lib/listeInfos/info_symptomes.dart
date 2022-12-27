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
  String text = ''' 
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            // SizedBox(
            //   height: 30,
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text(
                    //   "Les signes d’alerte",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: 25,
                    //       color: Colors.blueAccent),
                    //   textAlign: TextAlign.center,
                    // ),
                    Stack(
                      children: [
                        Image.asset(
                          'images/imSym1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),

                    SizedBox(height: 15),
                    SizedBox(
                      height: height * 0.13,
                      width: width * 0.95,
                      child: Card(
                        semanticContainer: true,
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        shadowColor: Colors.green[100],
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            //VISAGE PARALYSE
                            ListTile(
                              leading: Icon(Icons.dangerous,
                                  color: Colors.red, size: 45),
                              title: Text(
                                "VISAGE PARALYSÉ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              subtitle: Text(
                                  '''Inertie d'un membre (bras , jambes ou la moitié d’un corps )'''),
                              //
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Card(
                        semanticContainer: true,
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green, width: 3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        shadowColor: Colors.green[100],
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            //VISAGE PARALYSE
                            ListTile(
                              leading: Icon(Icons.dangerous,
                                  color: Colors.red, size: 45),
                              title: Text(
                                "TROUBLE DE LA PAROLE",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              subtitle: Text(
                                  '''En urgence, appeler le numéro urgence disponible sur l’application pour être pris en charge'''),
                              //
                            ),
                          ],
                        ),
                      ),
                    ),
                    // new Container(
                    //   margin: const EdgeInsets.only(top: 5.0, left: 5),
                    //   child: Text(
                    //     text + text2,
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.w400,
                    //       fontSize: 18,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
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
