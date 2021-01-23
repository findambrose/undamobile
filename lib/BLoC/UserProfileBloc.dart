import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unda/BLoC/Bloc.dart';
import 'package:unda/Helpers/UserProfile.dart';

class UserProfileBloc implements Bloc {
  UserProfileBloc(UserProfile userProfile){
    streamProfileInfo = _behaviorSubject.distinct().asyncMap(userProfile.getUserProfile).asBroadcastStream();
    
  }
  //input to sinks: uid

  //output: userStream profile
  BehaviorSubject<String> _behaviorSubject = BehaviorSubject();
  Stream<QuerySnapshot> streamProfileInfo = Stream.empty();
  Sink getSink() => _behaviorSubject;
  @override
  void dispose() {
    // TODO: implement dispose
    _behaviorSubject.close();

  }
  
}
