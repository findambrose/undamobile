import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unda/Data%20Layer/models/POJOs/mechanic.dart';

class MechanicRepo {
  CollectionReference mechanicsCollection =
      FirebaseFirestore.instance.collection("users");
  List<Mechanic> mechanics = [];
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
