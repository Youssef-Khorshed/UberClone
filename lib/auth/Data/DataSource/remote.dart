import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../Core/exception.dart';

abstract class AuthRemote {
  Future<User?> login({required String email, required String password});
  Future<User?> register(
      {required String email,
      required String password,
      required String username,
      required String phone,
      required bool driver});
  Future<void> updateProfile({required User userupdate});
  Future<void> logout();
  Future<void> updatePassword(
      {required String currentPassword, required String newPassword});
  Future<User?> signInWithGoogle();
}

class AuthRemoteImp extends AuthRemote {
  final firebase = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance.collection('users');

  Dio dio;
  AuthRemoteImp({required this.dio});

  @override
  Future<User?> login({required String email, required String password}) async {
    try {
      UserCredential resopnse = await firebase.signInWithEmailAndPassword(
          email: email, password: password);

      return Future.value(resopnse.user);
    } on FirebaseAuthException catch (error) {
      // throw userException(message: error.toString());
      Get.showSnackbar(GetSnackBar(
        message: error.toString().substring(4).toString(),
      ));
    }
  }

  @override
  Future<User?> register(
      {required String email,
      required String password,
      required String username,
      required String phone,
      required bool driver}) async {
    try {
      UserCredential resopnse = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      try {
        firestore.add(add_user(
            email: resopnse.user!.email!,
            password: resopnse.user!.uid,
            driver: driver,
            phone: phone,
            username: username));
      } on AuthException catch (error) {
        Get.showSnackbar(GetSnackBar(
          message: error.message,
        ));
      }

      return resopnse.user;
    } on AuthException catch (error) {
      show_message(message: error.message);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await firebase.signOut();
    } on AuthException catch (error) {
      show_message(message: error.message);
    }
  }

  @override
  Future<void> updateProfile({required User userupdate}) async {
    try {
      User? user = firebase.currentUser;
      if (user != null) {
        await user.updateDisplayName(userupdate.displayName);
        await user.updateEmail(userupdate.email!);
        await user.updatePhotoURL(userupdate.photoURL);
        await user.reload();
      } else {
        show_message(message: 'There is no User');
      }
    } on AuthException catch (error) {
      show_message(message: error.message);
    }
  }

  Future<void> updatePassword(
      {required String currentPassword, required String newPassword}) async {
    try {
      User? currentUser = firebase.currentUser;

      if (currentUser != null) {
        // Create a credential with the current password
        AuthCredential credential = EmailAuthProvider.credential(
            email: currentUser.email!, password: currentPassword);

        // Reauthenticate the user
        await currentUser.reauthenticateWithCredential(credential);

        // Update the password
        await currentUser.updatePassword(newPassword);
        // update user
        await currentUser.reload();
      } else {
        show_message(message: 'There is no User');
      }
    } on AuthException catch (error) {
      show_message(message: error.message);
    }
  }

  Map<String, dynamic> add_user(
          {required String email,
          required String password,
          required String username,
          required String phone,
          required bool driver}) =>
      {'username': username, 'email': email, 'phone': phone, 'driver': driver};

  @override
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        Get.showSnackbar(const GetSnackBar(
          message: 'No User',
        ));
      } else {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final OAuthCredential googleCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(googleCredential);
        final User? user = authResult.user;
        return user;
      }
    } on AuthException catch (error) {
      show_message(message: error.message);
    }
  }

  show_message({required String message}) => Get.showSnackbar(GetSnackBar(
        message: message,
      ));
}
