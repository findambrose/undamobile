import 'package:rxdart/rxdart.dart';
import 'package:unda/Data%20Layer/Repositories/MechanicRepo.dart';
import 'package:unda/Data%20Layer/models/POJOs/mechanic.dart';

class SearchBloc{
  BehaviorSubject<String> behaviorSubject = BehaviorSubject();
  Stream<List<Mechanic>> mechanicsList = Stream.empty();

  SearchBloc(MechanicRepo mechanicRepo){
    mechanicsList = behaviorSubject.distinct().asyncMap(mechanicRepo.getAllByLocation).asBroadcastStream();

  } 


}