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
                //                         "Les diff??rents types d'AVC ,Il existe deux types d'AVC : isch??miques (provoqu??s par l'obstruction d'un vaisseau sanguin par un caillot) ou h??morragiques (provoqu??s par une h??morragie)AVC isch??mique. AVC h??morragique, Il est ici question de la rupture d'un vaisseau, entra??nant une  h??morragie. Le sang se r??pand et endommage le tissu c??r??bral alentour. La localisation et la grosseur de l'h??matome d??terminent sa gravit??. On parle dans ce cas d'AVC h??morragique, d'h??morragie c??r??brale ou d'h??matome c??r??bral.???On estime que 20% des AVC sont de nature h??morragique. Les cons??quences des AVC d??pendent de nombreux facteurs : la vitesse de r??tablissement de la circulation sanguine, la dur??e de la privation en oxyg??ne et la localisation c??r??brale de l'accident.",
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

            //D??but Bloc sympt??mes
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
                      "LES SYMPT??MES DE L'AVC",
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
                                    SizedBox(
                                      height: 15,
                                    ),
                                    new Container(
                                      margin: const EdgeInsets.only(top: 5.0),
                                      child: new Text(
                                        '''le Protocole de prise en charge des AVC isch??miques : apr??s un scanner c??r??bral et/ ou une IRM c??r??brale ??liminant une h??morragie intra parenchymateuse ou m??ning??e Aspegic 250 mg IV le premier jour , puis relais  le lendemain  Kardegic 160 mg ( 1 scht ?? midi ) Nacl 0,9 % 1L sur 24h en continue Lovenox 4000 UI/0,4 ml une seringue en ss/c par jour Protocole insuline ( adapt??e en fonction de la glyc??mie )Traitement de la TA que si >220/120 mmHg dans les 72h minimales qui suivent l???AVC , par le nicardipine 1mg/ml (50 ml vitesse 0,5 mh/h ),Position inclin??e au 30?? au premier jour ,puis assise au 2??me jour ,  puis fauteuil et lever autoriser au 3??me jour ?? l???absence de st??nose intra ou extra cr??nienne aux examens radiologiques des troncs supra aortiques ;Surveillances TA, FC, Glyc??mie , Saturation en oxyg??ne, globe vesical , NIHSS ( clinique ).
                                        Bilan etiologique Echodoppler des troncs supra aortiques Echographie trans-thoracique ou trans-oesophagienne ( patient jeune < 55 ans ) ,Holter ECG de 72 h ,Bilan biologique : ASAT, ALAT,GGT,PAL, BILIRUBINE, CHOLESTEROL HDL, TRIGLYCERIDES, LDL, NFS, IONOGRAMME COMPLET, UREE, CREATININE, CLAIRANCE, FIBRINOGENE, TP, TCA, CRP, HBA1C A JEUN, TSH/FT4, TROPONINE, VIT B12, B9, B6 Et d??buter d??s le lever du malade : kin??sith??rapie , ergoth??rapie , orthophoniste et orienter dans un centre de r????ducation fonctionnel ou un soins de suivi et de r??adaptation apr??s la r??alisation du bilan ??tiologique. 
                                        Traitement de sortie en focntion de la cause Selon la classification TOAST, on distingue 5 causes 
                                          -	Atheromateuse ( stenose intra cranienne ou extra cranienne > 50% ) 2AAP pendant 21 jours ou 3 mois puis passage au simple AAP, Atorvastatine forte 80 mg dose avec obj LDL < 0,55 g/L
                                          -	Cardio embolique ( FA , Flutter , thrombus intra VG ) : Eliquis , Xarelto , Pradaxa 
                                          -	Microangiopathique :  simple AAP , atorvastatine forte dose obj LDL <0,70 g/L
                                          -	Cause rares ( dissection arterielle , FOP-ASIA , troubles de la coagulation = simple AAP, si cancer = INNOHEP ) 
                                          -	Cause indetermin??e : simple AAP .
                                          
                                            Protocole de traitement AVC HEMMORAGIQUE 
                                            Nacl 0,9 % 1L sur 24h en continue 
                                            Lovenox 4000 UI/0,4 ml une seringue en ss/c par jour ?? partir de J2
                                            Protocole insuline 
                                            Traiter la TA par le nicardipine 1mg/ml (50 ml vitesse 0,5 mh/h )obj < 135/85 mmHg
                                            Position inclin??e au 30?? au premier jour ,puis assise au 2??me jour ,  puis fauteuil et lever autoriser au 3??me jour ?? l???absence de st??nose intra ou extra cr??nienne aux examens radiologiques des troncs supra aortiques ;
                                            Surveillances TA, FC, Glyc??mie , Saturation en oxyg??ne, globe vesical , ETAT DE CONSCIENCE , NIHSS ( clinique )   ''',
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
