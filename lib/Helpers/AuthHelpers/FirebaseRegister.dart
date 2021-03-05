import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_admin/firebase_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:unda/Data%20Layer/models/POJOs/user.dart' as UserModel;
import 'package:unda/LoadingPage.dart';
import 'package:unda/Views/FirebaseError.dart';

class FirebaseRegister {
  User user;
  var errorMsg;
  Map<String, dynamic> map;
  UserModel.User userReturned;
  BuildContext context;
  FirebaseRegister({this.context});

  Future<Map<String, dynamic>> registerUser(Map userInput) async {
    //Perform firebase registration
    //1. Breakdwown Map to get user input
    //2. Register user
    //3. Return user object

    final _firebaseAuthInstance = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    //FirebaseAdmin _firebaseAdmin = FirebaseAdmin.instance;
    String role = userInput['role'];
    // HashMap claims = new HashMap();

    userToUserModelNoError(User user, String role) {
      userReturned = UserModel.User();
      userReturned.email = user.email;
      userReturned.role = role;
      map = {"user": userReturned, "error": "No error"};
      return map;
    }

    userToUserModeloNError(String errorMsg) {
      userReturned = UserModel.User();

      userReturned.email = user.email;
      userReturned.role = role;
      map = {"user": "Error", "error": errorMsg};
      return map;
    }

    try {
      await _firebaseAuthInstance
          .createUserWithEmailAndPassword(
              email: userInput['email'].trim().toString(),
              password: userInput['password'].trim())
          .then((userCredential) {
        //User is automatically signed in
        //var userUid = userCredential.user.uid;

        user = userCredential.user;
        userInput['userUid'] = user.uid;
          userInput['profileStatus'] = "";
           
        print("Firebase Email: ${user.email}");
        print("Should not fire on error");
        userToUserModelNoError(user, role);
        //save to db
        //1. Create reference to firestore collection
        CollectionReference users = firebaseFirestore.collection('users');
        users
            .add(userInput)
            .then((value){print("User Additional info added");})
            .catchError((e) {
          print(
              "Error encountered adding user additional info ${e.toString()}");
        });

        //Set role
        // Map claim = {role: true};
        // setClaims(userUid, claim);

        // navigateUser();
        /// print("Returned/Converted user: ${userReturned.email}");
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'EMAIL_ALREADY_IN_USE') {
        errorMsg = "Email address in use";
      }

      if (e.code == 'ERROR_INVALID_EMAIL') {
        errorMsg = "Invalid email address";
      }

      errorMsg = "An undefined error occured";
      print("Error Encountered: Error Code==> ${e.code} \n $errorMsg");
      userToUserModeloNError(errorMsg);
    }

    if (user != null) {
      print("User debug email: ${user.email}");
    }

    return map;
  }
}
