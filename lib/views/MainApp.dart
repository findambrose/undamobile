import 'package:flutter/material.dart';
import 'package:unda/Views/mechanic/mechanic_home.dart';
import 'package:unda/views/Profile.dart';

import 'package:unda/views/Vehicle/AddVehicle.dart';
import 'package:unda/views/mechanic_dets.dart';
import 'package:unda/views/AllResults.dart';
import 'package:unda/views/Auth/Login.dart';
import 'package:unda/views/Auth/Register.dart';
import 'package:unda/views/Home.dart';

import 'OnBoarding/OnBoarding.dart';
import 'Vehicle/problem_description.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unda',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      // home: MechanicDetailsPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => OnBoarding(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/mech-home': (context) => MechanicHome(),
        '/home': (context) => Home(),
        '/addVehicle': (context) => AddVehicle(),
        '/profile': (context) => Profile(),
        '/problem': (context) => ProblemDescription(),
        '/allResults': (context) => AllResults(),
        '/mechDets': (context) => MechanicDetailsPage(),
      },
    );
  }
}
