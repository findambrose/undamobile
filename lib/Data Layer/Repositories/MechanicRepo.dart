import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unda/Data%20Layer/models/POJOs/mechanic.dart';

class MechanicRepo {
  CollectionReference mechanicsCollection =
      FirebaseFirestore.instance.collection("users");
  List<Mechanic> mechanics = [];

  String response;

  Future<String> updateProfile(Map<String, dynamic> profileInput) async {
    Map mechDets = {
      "specialization": profileInput['specialization'],
      "rating": "Not Rated"
    };

    profileInput['userUid'] = FirebaseAuth.instance.currentUser.uid;
    String phone = profileInput['phone'];
    await FirebaseFirestore.instance
        .collection('mechanics')
        .add(mechDets)
        .then((value) async{
      print("Additional info added successfuly");

      await FirebaseFirestore.instance
          .collection('users')
          .where("userUid", isEqualTo: FirebaseAuth.instance.currentUser.uid)
          .limit(1)
          .get()
          .then((value) {
        String docId;

        value.docs.forEach((element) {
          docId = element.id;
        });

        FirebaseFirestore.instance.collection('users').doc(docId).set({"phone": phone, 
       "profileStatus": "updated" }, SetOptions(merge: true)).then((value){

          print("Phone added successfuly");
          response = "Operation successful";
          
        }).catchError((e){
            print("Error caught: " + e.message);
        });

        
      }).catchError((e) {
        print("Error caught: " + e.message);
      });
    }).catchError((e) {
      print("Error caught: " + e.message);
    });

    return response;
  }

  getAll() {}
  Future<List<Mechanic>> getAllByLocation(String location) async {
    print("Location: $location");
    await mechanicsCollection
        .where("county", isEqualTo: location)
        .where("role", isEqualTo: "Mechanic")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        print("INSIDE FOREACH");
        Mechanic mechanic;

        print("Element: ${element.data()}");
        mechanic = Mechanic(
            location: "${element.data()["county"]}",
            name:
                "${element.data()["firstName"]} ${element.data()["lastName"]}",
            rating: 4.toString(),
            mechanicUid: element.data()["userUid"],
            specialization: "Engine",
            availability: "Closed",
            startingPrice: "700");

        print("After Mech Object... Mech specialization" +
            mechanic.specialization);

        print("Mech LOcation ${mechanic.location}");
        mechanics.add(mechanic);
        print(mechanics);
      });
    }).catchError((e) {
      print("Error Encountered: ${e.message}");
    });
    return mechanics;
  }
}
