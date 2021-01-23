import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  QuerySnapshot snapshot;
  Future<QuerySnapshot> getUserProfile(String id) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    print("Getting Profile Info....");
    QueryDocumentSnapshot element;
    
      await users.where('userUid', isEqualTo: id).get().then((value) {
      value.docs.forEach((element) {
        //print("Element Firstname is: " + element["firstname"]);
      });
      print("SHOULD NOT FIRE ON ERROR");
      snapshot = value;
      element = element;
    }).catchError((e) {
      print(
          "Error caught:: Error code==>${e.code} \n Error Message: ${e.message}");
    });
      
    print("Element is: $element");
    return snapshot;
  }
}
