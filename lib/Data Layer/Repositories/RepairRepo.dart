import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unda/Data%20Layer/models/POJOs/repair.dart';
import 'package:unda/Data%20Layer/models/POJOs/user.dart';
import 'package:unda/Data%20Layer/models/POJOs/vehicle.dart';

class RepairRepo {
  String _response;
  List<Repair> repairsList = [];

  Map<String, String> actionResponse;

  Future<String> save(Map<String, dynamic> repairDets) async {
    CollectionReference repairs =
        FirebaseFirestore.instance.collection('repairs');
    await repairs.add(repairDets).then((value) {
      _response = "Repair Added Successfuly";
//TODO: Send sms to mechanic
    }).catchError((e) {
      print("Error Caught: ${e.message}");
    });

    return _response;
  }

  Future<List<Repair>> getPendingOrders(String uid) async {
    await FirebaseFirestore.instance
        .collection('repairs')
        .where('mechnaicUid', isEqualTo: uid)
        .where('acceptanceStatus', isEqualTo: "pending")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        Repair repair = Repair(
            repairId: element.id,
            location: element.data()['vehicleId'],
            acceptanceStatus: element.data()['acceptanceStatus'],
            addressDescription: element.data()['addressDecsription'],
            completionStatus: element.data()['comlpletionStatus'],
            mechanicUid: element.data()['mechnaicUid'],
            vOwnerUid: element.data()['vOwnerUid'],
            paymentStatus: element.data()['paymentStatus'],
            problemDescription: element.data()['problemDecsription'],
            repairType: element.data()['repairType'],
            supRepairRequestStatus: element.data()['supRepairRequestStatus'],
            supplementaryRepairRequest:
                element.data()['supplementaryRepairRequest'],
            vehicleId: element.data()['vehicleId']);
        repairsList.add(repair);
      });
    }).catchError((e) {
      print('Error encountered: ' + e.message);
    });

    return repairsList;
  }

  Future<List<Repair>> getCompletedOrders(String uid) async {
    await FirebaseFirestore.instance
        .collection('repairs')
        .where('mechnaicUid', isEqualTo: uid)
        .where('acceptanceStatus', isEqualTo: "pending")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        Repair repair = Repair(
            repairId: element.id,
            location: element.data()['vehicleId'],
            acceptanceStatus: element.data()['acceptanceStatus'],
            addressDescription: element.data()['addressDecsription'],
            completionStatus: element.data()['comlpletionStatus'],
            mechanicUid: element.data()['mechnaicUid'],
            vOwnerUid: element.data()['vOwnerUid'],
            paymentStatus: element.data()['paymentStatus'],
            supRepairRequestStatus: element.data()['supRepairRequestStatus'],
            problemDescription: element.data()['problemDecsription'],
            repairType: element.data()['repairType'],
            supplementaryRepairRequest:
                element.data()['supplementaryRepairRequest'],
            vehicleId: element.data()['vehicleId']);
        repairsList.add(repair);
      });
    }).catchError((e) {
      print('Error encountered: ' + e.message);
    });

    return repairsList;
  }

  Future<List<Repair>> getAllOrdersByUser(String uid) async {
/* 
Goal: Get sql join like functionality

1. fetch repairs by mechId
2. fecth all vehicles
3. fetch all users
4. for each repair; 
check if for each user, 
user.userUid is equal to repair.vownerId //Goal:: Get vehicle_owner name
5. If true add each user record that
matches to predefined Repair info list
6. If false do nothing
*/

//TODO: Create helper class for above functionality

    List<Repair> repairsById = [];
    Repair repair;
    QuerySnapshot allVehicles;
    QuerySnapshot allUsersSnapshot;
    // await FirebaseFirestore.instance.collection('users').get().then((element) {
    //   print("Got all users");
    //   allUsersSnapshot = element;
    // }).catchError((e) {});
    // await FirebaseFirestore.instance
    //     .collection('vehicles')
    //     .get()
    //     .then((vehicleQDocSnapshot) {
    //       print("Got all vehicles");
    //   allVehicles = vehicleQDocSnapshot;
    // }).catchError((e) {});

    await FirebaseFirestore.instance
        .collection('repairs')
        .where('mechnaicUid', isEqualTo: uid)
        .get()
        .then((value) {
          print("Got all repairs by vehicles");
      value.docs.forEach((element) async {
        //For each repair record, get each users record and
        //compare ids
        
         
            repair = Repair(
              location: element.data()['county'],
              acceptanceStatus: element.data()['acceptanceStatus'],
              addressDescription: element.data()['addressDecsription'],
              completionStatus: element.data()['completionStatus'],
              mechanicUid: element.data()['mechnaicUid'],
              vOwnerUid: element.data()['vOwnerUid'],
              paymentStatus: element.data()['paymentStatus'],
              supRepairRequestStatus: element.data()['supRepairRequestStatus'],
              problemDescription: element.data()['problemDecsription'],
              // repairType: element.data()['repairType'],
              supplementaryRepairRequest:
                  element.data()['supplementaryRepairRequest'],
              vehicleId: element.data()['vehicleId'],
              //dateCreated: element.data()['dateCreated'],
            );

           

        

       

        

        repairsList.add(repair);
      });
    }).catchError((e) {
      print('Error encountered: ' + e.message);
    });

    return repairsList;
  }

  Future<Map<String, String>> rejectNewOrder(String repairId) async {
    await FirebaseFirestore.instance
        .collection('repairs')
        .doc(repairId)
        .set({"acceptanceStatus": "rejected"}, SetOptions(merge:true)).then((value) {
      actionResponse = {
        "error": "No Error",
        "data": "Repair successfully rejected"
      };
    }).catchError((e) {
      print('Error encountered: ' + e.message);
    });

    return actionResponse;
  }

  Future<Map<String, String>> cancelPendingOrder(String repairId) async {
    await FirebaseFirestore.instance
        .collection('repairs')
        .doc(repairId)
        .set({"acceptanceStatus": "cancelled"}).then((value) {
      actionResponse = {
        "error": "No Error",
        "data": "Repair successfully cancelled"
      };
    }).catchError((e) {
      print('Error encountered: ' + e.message);
    });

    return actionResponse;
  }

  Future<Map<String, String>> acceptPendingOrder(String repairId) async {
    await FirebaseFirestore.instance.collection('repairs').doc(repairId).set({
      "acceptanceStatus": "accepted",
      "completionStatus": "ongoing"
    }, SetOptions(merge: true)).then((value) {
      actionResponse = {
        "error": "No Error",
        "data": "Repair successfully accepted"
      };
    }).catchError((e) {
      print('Error encountered: ' + e.message);
    });

    return actionResponse;
  }

  Future<Map<String, String>> cancelOngoingOrder(String repairId) async {
    await FirebaseFirestore.instance
        .collection('repairs')
        .doc(repairId)
        .set({"completionStatus": "cancelled"}, SetOptions(merge: true)).then((value) {
      actionResponse = {
        "error": "No Error",
        "data": "Repair successfully cancelled"
      };
    }).catchError((e) {
      print('Error encountered: ' + e.message);
    });

    return actionResponse;
  }

  Future<Map<String, String>> completeOngoingOrder(String repairId) async {
    await FirebaseFirestore.instance
        .collection('repairs')
        .doc(repairId)
        .set({"completionStatus": "completed"}, SetOptions(merge: true)).then((value) {
      actionResponse = {
        "error": "No Error",
        "data": "Repair successfully completed"
      };
    }).catchError((e) {
      print('Error encountered: ' + e.message);
    });

    return actionResponse;
  }

  Future<Map<String, String>> requestSupplementaryRepair(
      String repairId, String supRepairDetails) async {
    await FirebaseFirestore.instance.collection('repairs').doc(repairId).set({
      "supplementaryRepairRequest": supRepairDetails,
      "supRepairRequestStatus": "pending"
    }, SetOptions(merge: true)).then((value) {
      actionResponse = {
        "error": "No Error",
        "data": "Supplementary repair request sent successfully"
      };
    }).catchError((e) {
      print('Error encountered: ' + e.message);
    });

    return actionResponse;
  }

  Future<List<Repair>> viewSupRepairs(String vehicleOwnerUid) async {
    await FirebaseFirestore.instance
        .collection('repairs')
        .where('supRepairRequestStatus', isEqualTo: "pending")
        .where('vOwnerUid', isEqualTo: vehicleOwnerUid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        Repair repair = Repair(
            location: element.data()['vehicleId'],
            acceptanceStatus: element.data()['acceptanceStatus'],
            addressDescription: element.data()['addressDecsription'],
            completionStatus: element.data()['comlpletionStatus'],
            mechanicUid: element.data()['mechnaicUid'],
            vOwnerUid: element.data()['vOwnerUid'],
            paymentStatus: element.data()['paymentStatus'],
            supRepairRequestStatus: element.data()['supRepairRequestStatus'],
            problemDescription: element.data()['problemDecsription'],
            repairType: element.data()['repairType'],
            supplementaryRepairRequest:
                element.data()['supplementaryRepairRequest'],
            vehicleId: element.data()['vehicleId']);
        repairsList.add(repair);
      });
    }).catchError((e) {
      print('Error encountered: ' + e.message);
    });

    return repairsList;
  }

  Future<Map<String, String>> acceptSupplementaryRepairRequest(
      String repairId) async {
    await FirebaseFirestore.instance
        .collection('repairs')
        .doc(repairId)
        .set({"supRepairRequestStatus": "accepted"}, SetOptions(merge: true)).then((value) {
      actionResponse = {
        "error": "No Error",
        "data": "Supplementary repair request sent successfully"
      };
    }).catchError((e) {
      print('Error encountered: ' + e.message);
    });

    return actionResponse;
  }

  Future<Map<String, String>> rejectSupplementaryRepairRequest(
      String repairId) async {
    await FirebaseFirestore.instance
        .collection('repairs')
        .doc(repairId)
        .set({"supRepairRequestStatus": "rejected"}, SetOptions(merge: true)).then((value) {
      actionResponse = {
        "error": "No Error",
        "data": "Supplementary repair request rejected"
      };
    }).catchError((e) {
      print('Error encountered: ' + e.message);
    });

    return actionResponse;
  }
}
