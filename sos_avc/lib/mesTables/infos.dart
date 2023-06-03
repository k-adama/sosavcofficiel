// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:sos_avc/listeInfos/info_maladie.dart';
import 'package:sos_avc/listeInfos/info_mesures.dart';
import 'package:sos_avc/listeInfos/info_symptomes.dart';
import 'package:sos_avc/listeInfos/vulnerables.dart';
import 'package:sos_avc/listeInfos/protocoles.dart';

void main() {
  runApp(const MyInfos());
}

class MyInfos extends StatelessWidget {
  const MyInfos({super.key});

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
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyMaladie(),
                    ),
                  );
                }),
                // onTap: () {
                //   showModalBottomSheet(
                //     context: context,
                //     isScrollControlled: true,
                //     // shape: const RoundedRectangleBorder(
                //     //     borderRadius: BorderRadius.vertical(
                //     //   top: Radius.circular(30),
                //     // )),
                //     builder: (context) => DraggableScrollableSheet(
                //         initialChildSize: 0.9,
                //         maxChildSize: 1,
                //         minChildSize: 0.32,
                //         expand: false,
                //         builder: (context, scrollController) {
                //           return SingleChildScrollView(
                //               controller: scrollController,
                //               child: Container(
                //                 child: Expanded(
                //                     child: new Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: <Widget>[
                //                     Stack(
                //                       children: [
                //                         Container(
                //                           child: Image.asset(
                //                             'images/imAvc1.jpg',
                //                             fit: BoxFit.cover,
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                     SizedBox(
                //                       height: 15,
                //                     ),
                //                     new Container(
                //                       margin: const EdgeInsets.only(top: 5.0),
                //                       child: new Text(
                //                         "Les différents types d'AVC ,Il existe deux types d'AVC : ischémiques (provoqués par l'obstruction d'un vaisseau sanguin par un caillot) ou hémorragiques (provoqués par une hémorragie)AVC ischémique. AVC hémorragique, Il est ici question de la rupture d'un vaisseau, entraînant une  hémorragie. Le sang se répand et endommage le tissu cérébral alentour. La localisation et la grosseur de l'hématome déterminent sa gravité. On parle dans ce cas d'AVC hémorragique, d'hémorragie cérébrale ou d'hématome cérébral.•On estime que 20% des AVC sont de nature hémorragique. Les conséquences des AVC dépendent de nombreux facteurs : la vitesse de rétablissement de la circulation sanguine, la durée de la privation en oxygène et la localisation cérébrale de l'accident.",
                //                         style: new TextStyle(
                //                             color: Colors.black,
                //                             fontSize: 20.0),
                //                         textAlign: TextAlign.justify,
                //                       ),
                //                     ),
                //                   ],
                //                 )),
                //               ));
                //         }),
                //   );
                // },
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.coronavirus,
                      size: 70.0,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "QU'EST CE QUE L'AVC",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
              ),
            ),
            //Fin qu'est ce que l'AVC

            //Début Bloc symptômes
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MySymptomes(),
                    ),
                  );
                }),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.dangerous, size: 70.0),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "LES SYMPTÔMES DE L'AVC",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
              ),
            ),

            // MESURES DE PREVENTIONS AVC
            Card(
              color: Colors.green,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyMesuresPreventives(),
                    ),
                  );
                }),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.health_and_safety, size: 70.0),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "MESURES DE PREVENTIONS",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
              ),
            ),

            //PERSONNES VULNERABLES
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyVulnerables(),
                    ),
                  );
                },
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.person_off, size: 70.0),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "LES SIGNES DE L'AVC",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
              ),
            ),

            //PROTOCOLES
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProtocolesPage(),
                    ),
                  );
                },
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.medical_services, size: 70.0),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "PROTOCOLES",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
