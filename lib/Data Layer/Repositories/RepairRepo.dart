import 'package:cloud_firestore/cloud_firestore.dart';

class RepairRepo {
  Future<String> save(Map<String, dynamic> repairDets) async {
String _response;
    CollectionReference repairs = FirebaseFirestore.instance.collection('repairs');
    await repairs.add(repairDets).then((value){
_response = "Repair Added Successfuly";
//TODO: Send sms to mechanic
    }).catchError((e){
      print("Error Caught: ${e.message}");
    });

    return _response;
  }
}
