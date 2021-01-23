import 'package:flutter/material.dart';
import 'package:unda/Views/MainApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'LoadingPage.dart';
import 'Views/FirebaseError.dart';

void main(){
 WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //FlutterFire future
  //TODO: Add firebase to dependencies  
  
  Future _initialization = Firebase.initializeApp();
 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:_initialization,
      builder: (context, snapshot){
        if (snapshot.hasError) {
          return SomeErrorOcurred(); //page to show error
        }
        if (snapshot.connectionState == ConnectionState.done) {
          //show main app i.e Material App
          return  MainApp();
        }
        return LoadingPage();
      }
      
         
    );
  }
}


