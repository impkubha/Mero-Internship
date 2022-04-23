import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:merointernship/screens/homepage.dart';
import 'package:merointernship/screens/mainscreen.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  //Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    Get.to(MainScreen());
    Get.snackbar("Logout", "You have been logged out successfully");
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.to(Homepage());
      Get.snackbar("Success", "Login Successful");
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Failed", e.message!);
      return e.message;
    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<String?> signUp(
      {required String email,
      required String password,
      required String cpassword}) async {
    if (password == cpassword) {
      try {
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        Get.snackbar("Success", "Account created");
        Get.to(MainScreen());
      } on FirebaseAuthException catch (e) {
        Get.snackbar("Error", e.message!);
        //print(e.message);
      }
    } else {
      //print("Passwords don't match");
      Get.snackbar("Failed", "Unsuccessful to register");
    }
  }
}
