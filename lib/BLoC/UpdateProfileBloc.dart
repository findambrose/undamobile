import 'package:rxdart/rxdart.dart';
import 'package:unda/Data%20Layer/Repositories/MechanicRepo.dart';

class UpdateProfileBloc{

Stream<String> response = Stream.empty();
  BehaviorSubject<Map<String, dynamic>> behaviorSubject = BehaviorSubject();


UpdateProfileBloc(MechanicRepo mechanicRepo){
  response = behaviorSubject.distinct().asyncMap(mechanicRepo.updateProfile);
}
}