import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class WhichimomentFirebaseUser {
  WhichimomentFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

WhichimomentFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<WhichimomentFirebaseUser> whichimomentFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<WhichimomentFirebaseUser>(
      (user) {
        currentUser = WhichimomentFirebaseUser(user);
        return currentUser!;
      },
    );
