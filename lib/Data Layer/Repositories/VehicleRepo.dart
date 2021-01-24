import 'package:cloud_firestore/cloud_firestore.dart';

class VehicleRepo {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> save(Map<String, dynamic> vehicleData) async{
      Map<String, dynamic> response;
      CollectionReference vehicles = firebaseFirestore.collection("vehicles");

     await vehicles.add(vehicleData).then((value) async{
       var savedVehicle = await value.get();
       print("Saved Vehicle:" + savedVehicle["name"]);
          response = {
            "statusMsg": "Vehicle Added Successfully",
            "savedVehicle": savedVehicle
          };
          print(response);
      }).catchError((e){
        print("Error Caught:" + e.message);
      });

      return response;

  }

  getAll() {}
  getAllByUser() {}
  getOne() {}
}
