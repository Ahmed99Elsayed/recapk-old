import 'package:firebase_auth/firebase_auth.dart';
import 'package:prefirebase/models/user.dart';
import 'package:prefirebase/services/database.dart';

class AuthService {
  // take instance of FirebaseAuth class
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // class to filter data and take useful data like uid
  User _newFireBaseUser(FirebaseUser user) {
    return (user != null) ? User(uid: user.uid) : null;
  }

  // define a stream of user data that give response when user login or logout
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _newFireBaseUser(user));
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in anon
  // auth method to change user stream and return async value so we use future
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _newFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _newFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future register(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      List<String> userData;
      DataBaseServices(uid: user.uid).updateUserData(userData);
      return _newFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
