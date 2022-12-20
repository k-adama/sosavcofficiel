import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sos avc',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyListHospital(title: 'SOS AVC'),
    );
  }
}

class MyListHospital extends StatefulWidget {
  const MyListHospital({super.key, required this.title});

  final String title;

  @override
  State<MyListHospital> createState() => _MyListHospitalState();
}

class _MyListHospitalState extends State<MyListHospital> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -15,
          child: Container(
            width: 60,
            height: 7,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
          ),
        ),
        Column(children: const <Widget>[
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.local_hospital, color: Colors.cyan, size: 45),
            title: Text(
              "CHU COCODY ANGRE / Abidjan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            subtitle: Text("Numéro: 0000000"),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.local_hospital, color: Colors.cyan, size: 45),
            title: Text(
              "HOPITAL D'ICI ET D'AILLEURS / Yopougon",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            subtitle: Text("Numéro: 0000000"),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.local_hospital, color: Colors.cyan, size: 45),
            title: Text(
              "HOPITAL D'ICI ET D'AILLEURS / Yopougon",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            subtitle: Text("Numéro: 0000000"),
          ),
        ])
      ],
    );
  }
}
