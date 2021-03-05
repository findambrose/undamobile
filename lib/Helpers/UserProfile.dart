import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  QuerySnapshot snapshot;
  Future<QuerySnapshot> getUserProfile(String id) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    print("Getting Profile Info....");
    QueryDocumentSnapshot myElement;

    await users.where('userUid', isEqualTo: id).get().then((value) {
      print("success::::::::::::::::::::");
      value.docs.forEach((element) {
         myElement = element;
        print("Element Firstname is: " + element.data()["firstName"]);
      });
     
      snapshot = value;
       print("SHOULD NOT FIRE ON ERROR");
     
    }).catchError((e) {
      print(
          "Error caught:: Error code==>${e.code} \n Error Message: ${e.message}");
    });

    print("Element is:  $myElement");
    return snapshot;
  }
}
