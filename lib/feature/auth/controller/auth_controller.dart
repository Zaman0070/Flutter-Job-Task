import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_tasks/contants/firebase_contant.dart';
import 'package:job_tasks/feature/auth/login/login_screen.dart';
import 'package:job_tasks/feature/home/home_page.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;
  RxBool isLoading = false.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }


  _setInitialScreen(User? user) {
    if (user != null) {
      Get.offAll(() => const HomePaage());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  void register(String email, String password) async {
    isLoading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Error !',
          'The account already exists for that email.',
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void login(String email, String password) async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'user-not-found') {
        isLoading.value = false;
        Get.snackbar('Login !', 'This email is not registor as user.',
            backgroundColor: Colors.white54);
      } else if (e.code == 'wrong-password') {
        isLoading.value = false;
        Get.snackbar('Password !', 'Wrong Password!',
            backgroundColor: Colors.white54);
      }
    }
  }

    Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await auth.signInWithCredential(credential);
    } catch (error) {
      print('Google Sign-In Error: $error');
    }
  }

  void signOut() async{
    try {
    await  auth.signOut();
    await _googleSignIn.signOut();
      isLoading.value = false;
    } catch (e) {
      print(e.toString());
    }
  }
}
