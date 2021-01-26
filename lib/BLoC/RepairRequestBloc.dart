import 'package:rxdart/rxdart.dart';
import 'package:unda/Data%20Layer/Repositories/RepairRepo.dart';

class RepairRequestBloc{

BehaviorSubject<Map<String, dynamic>> behaviorSubject = BehaviorSubject();
Stream<String> response = Stream.empty();

RepairRequestBloc(RepairRepo repairRepo){
  response = behaviorSubject.distinct().asyncMap(repairRepo.save).asBroadcastStream();
}
}