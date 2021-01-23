import 'package:rxdart/rxdart.dart';
import 'package:unda/Data%20Layer/models/POJOs/user.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:unda/Helpers/AuthHelpers/FirebaseRegister.dart';
import 'Bloc.dart';

class RegisterBloc implements Bloc {
//Feed user reg details to register controller
//Manage States/ Screen changes based on output
  //1. If snapshot.error ==> error occured registering.
  //2. If snapshot.hasData ==> If success..successfully registered.
  Stream<Map<String, dynamic>> registeredUserStream = Stream.empty();

  BehaviorSubject<Map<String, dynamic>> _registerSubject =
      new BehaviorSubject<Map<String, dynamic>>();

  Sink get registerSink {
    return _registerSubject.sink;
  }

  //user firebase to register user
  RegisterBloc({FirebaseRegister firebaseRegister}) {
    registeredUserStream = _registerSubject
        .distinct()
        .asyncMap(firebaseRegister.registerUser)
        .asBroadcastStream();
  }

  @override
  void dispose() {
    _registerSubject.close();
  }
}
