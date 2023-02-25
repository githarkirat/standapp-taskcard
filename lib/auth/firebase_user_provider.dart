import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TaskcardFirebaseUser {
  TaskcardFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

TaskcardFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TaskcardFirebaseUser> taskcardFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TaskcardFirebaseUser>(
      (user) {
        currentUser = TaskcardFirebaseUser(user);
        return currentUser!;
      },
    );
