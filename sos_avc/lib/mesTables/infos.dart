import 'package:flutter/material.dart';
import 'package:sos_avc/listeInfos/info_mesures.dart';
import 'package:sos_avc/listeInfos/info_symptomes.dart';
import 'package:sos_avc/listeInfos/vulnerables.dart';

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
  //Debut fonction

  //Fin fonction
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
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    // shape: const RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.vertical(
                    //   top: Radius.circular(30),
                    // )),
                    builder: (context) => DraggableScrollableSheet(
                        initialChildSize: 0.9,
                        maxChildSize: 1,
                        minChildSize: 0.32,
                        expand: false,
                        builder: (context, scrollController) {
                          return SingleChildScrollView(
                              controller: scrollController,
                              child: Container(
                                child: Expanded(
                                    child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Stack(
                                      children: [
                                        Container(
                                          child: Image.asset(
                                            'images/imAvc1.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    new Container(
                                      margin: const EdgeInsets.only(top: 5.0),
                                      child: new Text(
                                        "Les accidents vasculaires cérébraux (AVC) sont caractérisés par la survenue brutale d'un déficit neurologique focal. Ils affectent environ 150000 patients par an, un nombre qui a tendance à augmenter en raison de l'augmentation de la population et de son vieillissement. Les AVC peuvent survenir à tout âge, y compris dans l'enfance, mais, dans 75 % des cas, il affecte des patients âgés de plus de 65 ans. L'âge moyen de survenue d'un AVC est de 73 ans (70 ans pour les hommes et 76 ans pour les femmes.",
                                        style: new TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                )),
                              ));
                        }),
                  );
                },
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.coronavirus,
                      size: 70.0,
                    ),
                    Text("Qu'est ce que l' AVC ?"),
                  ],
                )),
              ),
            ),

            //Bloc symptômes
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    // shape: const RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.vertical(
                    //   top: Radius.circular(30),
                    // )),
                    builder: (context) => DraggableScrollableSheet(
                        initialChildSize: 0.9,
                        maxChildSize: 0.9,
                        minChildSize: 0.32,
                        expand: false,
                        builder: (context, scrollController) {
                          return SingleChildScrollView(
                              controller: scrollController,
                              child: Container(
                                child: Expanded(
                                    child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Stack(
                                      children: [
                                        Container(
                                          child: Image.asset(
                                            'images/imSym1.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    new Container(
                                      margin: const EdgeInsets.only(top: 5.0),
                                      child: new Text(
                                        "Les signes et les symptômes d’un AVC sont les mêmes pour les hommes et les femmes.Les symptômes peuvent survenir soudainement ou peuvent apparaître et disparaître pendant quelques jours. Les principaux signes avant-coureurs et symptômes d’un AVC comprennent :une faiblesse d’un seul côté de votre corps un engourdissement ou un fourmillement au niveau du visage dans les bras ou dans les jambes.",
                                        style: new TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                )),
                              ));
                        }),
                  );
                },
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.dangerous, size: 70.0),
                    Text("Les symptômes de l'AVC !"),
                  ],
                )),
              ),
            ),

            // MESURES DE PREVENTIONS AVC
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.green,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    // shape: const RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.vertical(
                    //   top: Radius.circular(30),
                    // )),
                    builder: (context) => DraggableScrollableSheet(
                        initialChildSize: 0.9,
                        maxChildSize: 0.9,
                        minChildSize: 0.32,
                        expand: false,
                        builder: (context, scrollController) {
                          return SingleChildScrollView(
                              controller: scrollController,
                              child: Container(
                                child: Expanded(
                                    child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Stack(
                                      children: [
                                        Container(
                                          child: Image.asset(
                                            'images/imSym1.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    new Container(
                                      margin: const EdgeInsets.only(top: 5.0),
                                      child: new Text(
                                        "Elle repose sur la prise en charge des facteurs de risque d'AVC.• HTA : principal facteur de risque des AVC, ischémiques ou hémorragiques :augmentation du risque relatif (RR) de 4 environ ; plus de la moitié des AVC surviennent dans un contexte d'HTA chronique.Hypercholestérolémie : RR = 1,5. Ce facteur de risque majeur de l'infarctus du myocarde est un facteur de risque plus accessoire des infarctus cérébraux. ",
                                        style: new TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                )),
                              ));
                        }),
                  );
                },
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.health_and_safety, size: 70.0),
                    Text("Les mesures de preventions de l'avc"),
                  ],
                )),
              ),
            ),
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
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.person_off, size: 70.0),
                    Text("Les personnes vulnérables face à l'AVC"),
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
