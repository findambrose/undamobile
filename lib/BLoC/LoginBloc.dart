

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unda/BLoC/Bloc.dart';
import 'package:unda/Helpers/AuthHelpers/FirebaseLogin.dart';
class LoginBloc implements Bloc {
  //user firebase to login user

  //user stream

  Stream<Map<String, dynamic>> snapshot = Stream.empty();
  BehaviorSubject _behaviourSubject = BehaviorSubject();
  BehaviorSubject get mySubject  => _behaviourSubject;

  LoginBloc(FirebaseLogin firebaseLogin){
    snapshot = _behaviourSubject.distinct().asyncMap(firebaseLogin.fireBaseLogin).asBroadcastStream();
  }

  @override
  void dispose() {
 _behaviourSubject.close();
  }
}