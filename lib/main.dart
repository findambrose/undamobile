import 'package:flutter/material.dart';
import 'package:unda/views/AllResults.dart';
import 'package:unda/views/Home.dart';
import 'package:unda/views/Login.dart';
import 'package:unda/views/OnBoarding/OnBoarding.dart';
import 'package:unda/views/Painter.dart';
import 'package:unda/views/Profile.dart';
import 'package:unda/views/Register.dart';
import 'package:unda/views/Vehicle/AddVehicle.dart';
import 'package:unda/views/mechanic_dets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unda',
      theme: ThemeData(
       
        primarySwatch: Colors.yellow,
      ),
    // home: MechanicDetailsPage(),
       routes: {
         '/' : (context)=>Profile(),
         '/home' : (context)=>Home(),
         '/login' : (context)=>Login(),
         '/register' : (context)=>Register(),
         '/addvehicle' : (context)=>AddVehicle(),
       },
    );
  }
}


