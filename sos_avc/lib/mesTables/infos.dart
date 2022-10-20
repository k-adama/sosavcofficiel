// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sos_avc/listeInfos/info_maladie.dart';
import 'package:sos_avc/listeInfos/info_mesures.dart';
import 'package:sos_avc/listeInfos/info_symptomes.dart';
import 'package:sos_avc/listeInfos/vulnerables.dart';
import 'package:http/http.dart' as http;
//shared_preferences
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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


  //variables start
var idMalade;
bool accessInternet = false;
late List<String> dateCrises = [];
late List<String> actionCrises = [];


//Function start
  Future checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      accessInternet = true;
      
      getCrise();
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      accessInternet = true;
      
      getCrise();
      // I am connected to a wifi network.
    }else {
    
      getCrise();
    }
  }


  Future getCrise() async {
        final prefs =  await SharedPreferences.getInstance();
        var isCrisefetch = prefs.getString('isCrisefetch');
        
        
      if(accessInternet == true && (isCrisefetch == "false" || isCrisefetch == null)) {
       
        try{
  
          final response = await http.get(Uri.parse('https://avcespoir.simplonien-da.net/mobile/get_crise.php?idMalade=sqsdqds'));
    
          if(response.statusCode == 200){
            final data = jsonDecode(response.body);
            late List<String> fetchCriseDate = [];
            late List<String> fetchCriseAction = [];
            for(var i=0;i<data['date'].length;i++){
              fetchCriseDate.add(data['date'][i]);
              fetchCriseAction.add(data['action'][i]);
            }
            
            setState(() {
              prefs.setStringList('dateCrises',fetchCriseDate);
              prefs.setStringList('actionCrises',fetchCriseAction);
              dateCrises = prefs.getStringList('dateCrises')!;
              actionCrises = prefs.getStringList('actionCrises')!;
              prefs.setString('isCrisefetch',"true");
             
            });
           
          }
        }catch(e){
        
        }
      } else {
        
        setState(() {
              dateCrises = prefs.getStringList('dateCrises')!;
              actionCrises = prefs.getStringList('actionCrises')!;
            });
            
      }
    
  }
  Future<void>  requiredId() async {
      final prefs =  await SharedPreferences.getInstance(); //sharedpreference instence
    //get ID MALADE
    setState(() {
      idMalade = prefs.getString('idMalade');
    });
  }
  @override
  void initState() {
    requiredId();
    checkInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              for(var i=0;i<dateCrises.length;i++)
              Container(
                padding: EdgeInsets.only(bottom: 10,top:10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 78, 74, 74),
                      width: 1,
                    )
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.calendar_month_outlined,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          dateCrises[i],
                          style: TextStyle(
                            fontSize: 15, 
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        
                      ],
                    ),
                    SizedBox(
                          height: 7,
                        ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.pending_actions_outlined,
                          size: 30.0,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 30),
                            child: Text(actionCrises[i],
                              softWrap: true,                          
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 10,
                              style: TextStyle(
                                fontSize: 17, 
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      
                        
                        
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ]      
      ),  
    );
  }


}
