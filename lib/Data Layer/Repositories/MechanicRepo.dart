import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unda/Data%20Layer/models/mechanic.dart';

class MechanicRepo {
  CollectionReference mechanicsCollection =
      FirebaseFirestore.instance.collection("users");
  List<Mechanic> mechanics;
  getAll() {}
  Future<List<Mechanic>> getAllByLocation(String location) async {
    await mechanicsCollection
        .where("location", isEqualTo: location)
        .where("role", isEqualTo: "Mechanic")
        .get()
        .then((value){
          value.docs.forEach((element) {

            Mechanic mechanic = Mechanic(
              location: location,
              name: element["firstname"] + element["lastname"] ,
              rating: 4.toString(),
              specialization: "Engine"
            );
            mechanics.add(
             mechanic
            );
          });
        })
        .catchError((e) {
          print("Error Encountered: ${e.message}");
        });

    return mechanics;
  }
}
