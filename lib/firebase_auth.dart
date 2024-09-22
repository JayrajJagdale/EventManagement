import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  // Method for signing up users
  Future<void> signup({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with this email';
      } else {
        message = 'An unknown error occurred';
      }
      throw message;
    } catch (e) {
      throw 'An error occurred: $e';
    }
  }


  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      String msg;
      if (e.code == 'user-not-found') {
        msg = 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        msg = 'Wrong password provided for that user';
      } else if (e.code == 'invalid-email') {
        msg = 'The email address is badly formatted';
      } else {
        msg = 'An unknown error occurred: ${e.message}';
      }
      throw msg;
    } catch (e) {
      throw 'An error occurred: $e';
    }
  }
}
