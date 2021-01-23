import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:unda/Data%20Layer/models/POJOs/user.dart'as UserModel;

class FirebaseLogin {
  BuildContext context;

  QuerySnapshot userData;
  FirebaseLogin({this.context});
  String _errorMsg;
  Map<String, dynamic> loginResponse;

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //FirebaseAdmin _firebaseAdmin = FirebaseAdmin.instance;
  Future<Map<String, dynamic>> fireBaseLogin(loginDetsStream) async {
    try {
      print("Login starts here");
      await _firebaseAuth
          .signInWithEmailAndPassword(
              email: loginDetsStream['email'],
              password: loginDetsStream['password'])
          .then((user) async{
        String userUid = user.user.uid;
        print(userUid);
        //get user role
        CollectionReference _users =
            FirebaseFirestore.instance.collection('users');
        await _users.where("userUid", isEqualTo: userUid).get().then((value){
          userData = value;
        });
        //check user role
        //-------//
        loginResponse = {
          "error": "No error",
          "userData": userData,
          "id": userUid
        
        };
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        _errorMsg = "Enter a valid email address";
      }

      if (e.code == "unknown") {
        _errorMsg = "An internal error occured. Please restart the application";
      }

      if (e.code == "WRONG_PASSWORD") {
        _errorMsg = "Wrong email or password";
      }

      if (e.code == "USER_NOT_FOUND") {
        _errorMsg = "User not found. Register for an account first";
      }

      loginResponse = {'error': _errorMsg,
    "userData": "No user data"};

      print('Error Encountered:: Error code ==> ${e.code} \n Message: ${e.message}');
    }

    return loginResponse;
  }
}
