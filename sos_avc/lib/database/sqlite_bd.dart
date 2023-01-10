import 'package:sqflite/sqflite.dart' as sql;
import 'package:flutter/foundation.dart';

class SQLHelper {
  //method de cration de la BDD et d'insertion des données
  static Future<void> createTables(sql.Database database) async {

    await database.execute("""CREATE TABLE IF NOT EXISTS hopitaux (
    hopitaux_Ville_et_commune TEXT,
    hopitaux_geopoint TEXT,
    hopitaux_Cat_gorie TEXT,
    hopitaux_i INTEGER,
    hopitaux_id TEXT
    )
      """);
    
    await database.execute("""
      INSERT INTO hopitaux VALUES ('Yopougon','5.3391046,-4.09819','Hôpital',1,'pNbjtnc5aUnmRnpATgV2T'),
	('Oumé','6.3787759,-5.41866','Hôpital',12,'uwrzYNI5Cu2ecBOmHejWc'),
	('Oumé','6.3826969,-5.4151507','Clinique médicale',13,'T_ORRheIAjpmmiEsBwmcn'),
	('Man','7.4074644,-7.5517931','Pharmacie',14,'q5NcRl8gPGIBowGipv3gj'),
	('Man','7.4093685,-7.5495699','Pharmacie',15,'5fRDvt06BgC68PbUff1pD'),
	('Man','7.4116637,-7.5484649','Pharmacie',16,'owGZDVUAF3wUG0tNsiAIz'),
	('Cocody','5.3368409,-4.0133515','Hôpital',19,'AJ07Cm8L8E_kTGLxahq8Z'),
	('Cocody','5.3423413,-3.9938504','Hôpital',20,'KXnbQwaX1zxe9zSeZIql-'),
	('Yopougon','5.3258806,-4.1072196','Clinique médicale',36,'t4hshsZGvNIe9GkLob9jV'),
	('Tafiré','9.0701895,-5.1557986','Hôpital',37,'gS51cG_sO0zUlADMJkW6-'),
	('Oumé','6.3791133,-5.4149057','Clinique médicale',39,'hTTFSfO3I2Z3QsmK5e7ee'),
	('Plateau','5.3238016,-4.0161363','Hôpital',58,'RRqoTVWAkNT1uJTOQSIhm'),
	('Marcory','5.310661,-3.986472','Hôpital',61,'L5IROHIfmwAQMr_FmZksI'),
	('Gagnoa','6.126568,-5.9495901','Clinique médicale',72,'sSef-pdDsbba6l_Waqzka'),
	('Anyama','5.5009784,-4.0458498','Hôpital',98,'dX5r5emw6wXaHcW5xWMP0'),
	('Anyama','5.4998405,-4.0484132','Hôpital',99,'z-Tub8wKIRzh3Ejp3cHHx'),
	('Yopougon','5.3245002,-4.0807644','Pharmacie',104,'QCtXo1Zir6Le9XS_V39wx'),
	('Yopougon','5.3397977,-4.0736017','Pharmacie',105,'sdLWobF2eaBn3N-cYTQCw'),
	('Yopougon','5.3468317,-4.0731625','Pharmacie',106,'wkaaUNUsUMpsZCoyHOa5J'),
	('Yopougon','5.3414366,-4.0800482','Hôpital',117,'sFk_B97_u-0g8i6qeAGU_'),
	('Adiaké','5.2852072,-3.2988058','Hôpital',122,'RPA2p79jxTc_bDzxTeBCA'),
	('Le Plateau','5.3383835,-4.019068','Hôpital',123,'VvzeRA1SRhWu7aoFckRfZ'),
	('Duékoué','6.7430868,-7.3433898','Hôpital',136,'w-vQJ93tI6qDBL9PwrilK'),
	('Duékoué','6.7521113,-7.3367433','Hôpital',138,'A8uJUrQlvUC6DaLShBDik'),
	('Aboisso','5.4747187,-3.2065373','Hôpital',142,'6xzMEABJiuNsKE5nvs0cD'),
	('Yamoussoukro','6.826797,-5.2737974','Hôpital',228,'D_ocmfySDroicP2OwTrVh'),
	('Cocody','5.3777505,-3.9977536','Pharmacie',230,'Z_Nf8UZpDjnEBQTfPp5ig'),
	('yamoussoukro','6.8009538,-5.27301','Hôpital',233,'xJH-Bs31yoheAo8_DbpjT'),
	('Marcory','5.299279,-3.9848761','Pharmacie',242,'t_zG18v-3cYzCKxUn2fqX'),
	('Abidjan','5.3072654,-3.994634','Pharmacie',243,'Y-cptxNg-uak4x58ThR7J'),
	('Marcory','5.3068044,-3.985621','Pharmacie',244,'YjEjCKMUClvTmGgjcmyKl'),
	('Plateau','5.3221398,-4.0188051','Pharmacie',246,'ScPJ_XTcTxVwHckACFsJx'),
	('Attécoubé','5.3475083,-4.0370177','Pharmacie',255,'9uWNs_EpsMkpg9DM3j_WN'),
	('Attécoubé','5.3453334,-4.0345663','Pharmacie',257,'VF9F6r0b8N699Rs9ji0g_'),
	('Attécoubé','5.3432042,-4.0337071','Pharmacie',258,'3yBzhO1zGWm5tkbaZ2Ttu'),
	('Attécoubé','5.3508986,-4.0317393','Pharmacie',259,'6j65nQKdyzFoaD5FMjXIb'),
	('Treichville','5.2926887,-3.9977545','Pharmacie',262,'CaUj3l17sORinvVoieXsk'),
	('Adjamé','5.3486342,-4.0168001','Pharmacie',263,'l5njd_SrdfzaBjtuRKiJk'),
	('Grand Bassam','5.2112879,-3.737831','Pharmacie',266,'cweszI-5k5co2m2n_N0Od'),
	('Yopougon','5.3457189,-4.0531533','Pharmacie',267,'LYGLiu7ovRg5bbwxRqu0x'),
	('Yopougon','5.3406652,-4.067955','Pharmacie',268,'gGi8TaXKcGbslycz5N3Mo'),
	('Yopougon','5.3468205,-4.0635961','Pharmacie',269,'-WKUN8QqCGppOMPynz7-S'),
	('Yopougon','5.3406874,-4.0724302','Pharmacie',270,'nNoLEcp6l_gpHshfXBdk3'),
	('Yopougon','5.341204,-4.0659433','Pharmacie',271,'vAscgv83vSAhwHm3-dESh'),
	('Yopougon','5.3405566,-4.0587784','Pharmacie',272,'1V22Jw2gWB4zA_V4V-fyV'),
	('Yopougon','5.3436131,-4.0727649','Pharmacie',280,'JeKtNcbI-HXDkq1CK2JZ9'),
	('Marcory','5.3114387,-3.9734755','Clinique médicale',283,'WCo0zSqpSYnMYiwbwjsou'),
	('Marcory','5.3026733,-3.9797412','Pharmacie',284,'jfgFDt1LWTtpZJ1kKSwpE'),
	('Yopougon','5.3364327,-4.0548596','Pharmacie',286,'4VPNuIajaRpt_UhJMPZJJ'),
	('Yopougon','5.3500715,-4.0735112','Pharmacie',287,'-klWq6-6Pmg9FjSMhLAW0'),
	('Marcory','5.2979063,-3.9712851','Pharmacie',295,'qAkpORzxhT8thWbe1iNU8'),
	('Abidjan','5.3034734,-3.9622715','Pharmacie',296,'32ZBDUSKjHlFhhLDXEN_c'),
	('Yopougon','5.3316324,-4.0555269','Pharmacie',297,'oxz7zV91VAGQnNhmhTZUl'),
	('Sinfra','6.6227975,-5.913364','Pharmacie',301,'mcCqDG-hDngl2L6tlTzOp'),
	('Cocody','5.3372554,-4.0035477','Pharmacie',307,'ft-M8pFTGDfg779zThwqX'),
	('Cocody','5.3617174,-3.997705','Pharmacie',308,'pZOWR_QDTqF2KLVgiRvG5'),
	('Cocody','5.3656722,-3.9972212','Pharmacie',309,'Z3tOIwoRiX45VkQ5R9YRP'),
	('Bouaké','7.6813055,-5.0300772','Pharmacie',312,'2_alciprK4kUYoyDwqTJy'),
	('Adjamé','5.340781,-4.0263818','Pharmacie',313,'-FcLXp4uNxM9kxdLzmuAm'),
	('Cocody','5.3634869,-3.9594942','Pharmacie',314,'H5OxrVs1lBL7m2tkX6gAm'),
	('Cocody','5.3354868,-4.0019693','Pharmacie',322,'1oT78TBcrPedK84-2u4YT'),
	('Yopougon','5.3423827,-4.0747959','Pharmacie',323,'HfepsmCYVgxMIGMbIZwjT'),
	('Cocody','5.3693487,-3.9978189','Pharmacie',325,'2IgLESC1qHC7VQdau3uO_'),
	('Cocody','5.3878642,-3.9924989','Pharmacie',326,'smuyrSBe3mi9EFz6Z4egY'),
	('Yopougon','5.3400239,-4.1005786','Pharmacie',332,'x058PDGhSZVUEtKkgk3c0'),
	('Treichville','5.3055632,-4.0116529','Clinique médicale',338,'UErXyJII-3gae1czuuR6x'),
	('Treichville','5.3045163,-4.0091424','Pharmacie',340,'gPA4EVeyTx3s9Ru-SV8OY'),
	('Treichville','5.305654,-4.005677','Pharmacie',344,'RVE5Td4LotycFon4gqK4s'),
	('Treichville','5.3038611,-4.0040667','Pharmacie',345,'A5FEkMOSjI8Ul_eohfTcL'),
	('Treichville','5.3059906,-4.0120687','Pharmacie',347,'Ve9GPvqJCS5W6CHqtuVXz'),
	('Adjamé','5.3444314,-4.026204','Pharmacie',348,'xyYXnQxmS2VHnBY5lc7lc'),
	('Adjamé','5.345772,-4.026625','Pharmacie',349,'mOfrH7rlwtJ0J6QMwTg2t'),
	('Adjamé','5.3490948,-4.0227042','Pharmacie',351,'9QltE4Z4HBn4xORHsLE4O'),
	('Adjamé','5.3466992,-4.0250954','Pharmacie',352,'r-2O3k0BuEfNO2Bxzpr_-'),
	('Marcory','5.2870905,-3.9824791','Pharmacie',355,'-FASTwRn-kvCbKwfUJW-g'),
	('Grand Bassam','5.2081565,-3.7345512','Pharmacie',357,'T50331x4V2vd45YvjPwHV'),
	('Grand Bassam','5.2085565,-3.7346051','Pharmacie',358,'FwrxfyPRMQKSBEy1_VeTS'),
	('Koumassi','5.2999326,-3.9684052','Pharmacie',359,'sNzoBqURGywhPs540v-Sb'),
	('Yopougon','5.3315946,-4.0770513','Pharmacie',360,'1fzflMLDb8ftp2NrXk6er'),
	('Cocody','5.3773579,-3.9927496','Pharmacie',375,'VUrwqo8MR9q99-gvWiO43'),
	('Cocody','5.3741301,-3.9906204','Pharmacie',378,'j8lPyd_8jXervVBytChEx'),
	('Cocody','5.3841623,-3.9878665','Pharmacie',379,'fFmXKWnaHD8HUjF6S8IOm'),
	('Marcory','5.2939651,-3.9784192','Pharmacie',390,'MbcCFS2x2aYOFL2QaadP5'),
	('Yopougon','5.3156811,-4.091831','Pharmacie',410,'DAWizNOUvwbbB_YwBCfzH'),
	('Yopougon','5.3221012,-4.1034326','Pharmacie',411,'3bB-5prWyUkEijOERBlqU'),
	('Yopougon','5.3425079,-4.0802419','Pharmacie',412,'9CeQqWyy-HmtvoCZeYEVa'),
	('Adjamé','5.371906,-4.0122651','Pharmacie',413,'ONEtrdmW4_NLVIAIOhtbv'),
	('Cocody','5.3478871,-3.9756833','Pharmacie',420,'iquBWxNkP2DnAc_JcEXrh'),
	('Plateau','5.319949,-4.0167065','Pharmacie',436,'6ZxSC-Onalo-6BNLHWc0G'),
	('Cocody','5.3443531,-4.0112683','Clinique vétérinaire',437,'zEKcDzMfYySwKvpxopOHF'),
	('Grand Bassam','5.2158367,-3.7405218','Pharmacie',444,'VFy18pcAqdwMx3YcLCE2E'),
	('Grand Bassam','5.2056478,-3.7356447','Pharmacie',445,'JryaCGVI1_KqotUDIsDY1'),
	('Grand Bassam','5.2112228,-3.7544523','Pharmacie',447,'r0HUFcMYPYfoAtiUv23dQ'),
	('Marcory','5.3114348,-3.9735443','Pharmacie',455,'2o2v6z-AvILW7jt2Q87_L'),
	('Grand Bassam','5.2217178,-3.7261136','Pharmacie',456,'w4yK5ZmUrIrINir2qkG_z'),
	('Koumassi','5.3072032,-3.940928','Pharmacie',457,'d2n9eigpolkPdWRQPOlYU'),
	('Grand Bassam','5.2080895,-3.7388887','Pharmacie',475,'aOmSh5cTEqQpa2LRpFlDd'),
	('Cocody','5.3832122,-3.9859791','Clinique médicale',476,'lcTL3Yz3rqkrLYwg5L-yc'),
	('Tafiré','9.0694061,-5.163443','Pharmacie',484,'L_gpwl2aPkiD3SHqAOWv0'),
	('Koumassi','5.2884308,-3.9716152','Pharmacie',503,'d3X_3MrZ_Hmz42mSIIJHe'),
	('Koumassi','5.2914254,-3.9660246','Pharmacie',504,'upFWT_5poqWqzmBgAhjf0'),
	('Adjamé','5.3464688,-4.0226268','Pharmacie',555,'2NQ2c3NLtXcP5u6Zder4z'),
	('Duékoué','6.7381321,-7.3439164','Pharmacie',597,'opbiMYOf_FUUbR5mkK3If'),
	('Duékoué','6.7394845,-7.3452342','Clinique médicale',598,'8YK2AnB6IyTgaw_INC1E5'),
	('Duékoué','6.7463897,-7.3463327','Pharmacie',599,'AXttLsWDs4QDgepyJx5re'),
	('Duékoué','6.7469046,-7.3484705','Pharmacie',600,'Cz69p7oX6_ChrdwoYI3y2'),
	('Duékoué','6.7377186,-7.3510028','Clinique médicale',603,'CJR06t5kcHwRYWFoupiJ8'),
	('Duékoué','6.7391915,-7.3541786','Clinique médicale',604,'wTltOIAcVO4aA9HVSWASh'),
	('Duékoué','6.7367969,-7.3433767','Clinique médicale',605,'dmj35ofT1uB3hu9vucV7Q'),
	('Duékoué','6.7454871,-7.3450812','Clinique médicale',606,'-kWi7tkpzA9Ldxpf1UDvs'),
	('Duékoué','6.7461243,-7.3443925','Pharmacie',607,'8lMt-V_DpCTGI6TJQKOCo'),
	('Duékoué','6.7391807,-7.3426426','Clinique médicale',608,'528dbCYnl5uzfC79e9CVp'),
	('Marcory','5.302539,-3.9852955','Pharmacie',621,'p6cOGDlwoT1jyDxRZRo6_'),
	('Cocody','5.358161,-3.999915','Clinique médicale',628,'sQ6AjiEWo8jZuK8BlnH_-'),
	('Gagnoa','6.1408309,-5.9468009','Pharmacie',634,'3RWuXtY-gk6mTcxwxfYKH'),
	('Attécoubé','5.3491947,-4.0344216','Pharmacie',649,'g2QHragPEOUexFO3gR4g6'),
	('Cocody','5.3531145,-3.9767253','Pharmacie',652,'YfRuhYatE4G621p_kkljO'),
	('Grand Bassam','5.2153612,-3.7780427','Pharmacie',673,'RWykO-ekOYIyGkWyinqsd'),
	('Grand Bassam','5.2150589,-3.7645118','Pharmacie',675,'VZkGh81bkDYPImZ5xCZyS'),
	('Grand Bassam','5.1972074,-3.7373042','Pharmacie',676,'gUh3r0ye5OMc2Q_V99Rw_'),
	('Abidjan-Cocody','5.3282274,-3.954167','Pharmacie',683,'WQ9LLWFcoye0xkHwI-WGa'),
	('Abidjan -Cocody','5.328261,-3.9429339','Pharmacie',684,'Et06ANyNo9iBQckvtuh9E'),
	('akpessekro','6.732303,-5.3052598','Clinique médicale',1086,'3aPZjg1XyHQ-HJq2qqlMJ');

      """);
  }
// hopitaux_Ville_et_commune: la ville ou commune
// hopitaux_geopoint: les coordonée geographie de l'hopital
// hopitaux_Cat_gorie: le type de centre : hopital ou clinique
 

  //method d'initialisation de BDD
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'hopitaux.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Method de recupération des données 
  static Future<List<Map<String, dynamic>>> getHopitaux(String ville) async {
    final db = await SQLHelper.db();
    return db.query('hopitaux',columns: ["hopitaux_Ville_et_commune","hopitaux_geopoint","hopitaux_Cat_gorie","hopitaux_i"], where: "hopitaux_Ville_et_commune = ? AND hopitaux_Cat_gorie != ?", whereArgs: [ville,"Pharmacie"]);
  }

}