import 'package:rxdart/rxdart.dart';
import 'package:unda/Data%20Layer/Repositories/VehicleRepo.dart';

class VehicleBloc {
  BehaviorSubject<Map<String, dynamic>> subjectBehavior = BehaviorSubject();

  Stream<Map<String, dynamic>> response = Stream.empty();

  VehicleBloc(VehicleRepo repo) {
    response =
        subjectBehavior.distinct().asyncMap(repo.save).asBroadcastStream();
  }
}
