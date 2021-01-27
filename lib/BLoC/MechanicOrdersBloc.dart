import 'package:rxdart/rxdart.dart';
import 'package:unda/Data%20Layer/Repositories/RepairRepo.dart';
import 'package:unda/Data%20Layer/models/POJOs/mechanic.dart';
import 'package:unda/Data%20Layer/models/POJOs/repair.dart';
import 'package:unda/Views/mechanic/mechanic_orders.dart';
class MechanicOrdersBloc {
 Stream<List<Repair>> repairsList = Stream.empty();
  BehaviorSubject<String> behaviorSubject = BehaviorSubject();
  MechanicOrdersBloc(RepairRepo repairRepo){
    repairsList = behaviorSubject.distinct().asyncMap(repairRepo.getAllOrdersByUser).asBroadcastStream();
      
  }


}