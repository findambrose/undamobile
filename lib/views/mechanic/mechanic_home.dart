import 'package:flutter/material.dart';

//import 'MyPainter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MechanicHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Center(
          child: Column(
            children: [
              Text('Mechanic Home Page'),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    //get firebase auth instance
                    //invoke logout method
                    //take user to login screen
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text('Log Out')),
            ],
          ),
        ),
      ),
    ));
  }
}
