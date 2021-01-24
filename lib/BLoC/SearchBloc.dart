import 'package:rxdart/rxdart.dart';
import 'package:unda/Data%20Layer/Repositories/MechanicRepo.dart';
import 'package:unda/Data%20Layer/models/mechanic.dart';

class SearchBloc{
  BehaviorSubject<String> _behaviorSubject = BehaviorSubject();
  Stream<List<Mechanic>> mechanicsList = Stream.empty();

  SearchBloc(MechanicRepo mechanicRepo){
    mechanicsList = _behaviorSubject.distinct().asyncMap(mechanicRepo.getAllByLocation).asBroadcastStream();

  } 


}