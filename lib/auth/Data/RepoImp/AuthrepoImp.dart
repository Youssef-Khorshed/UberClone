import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/Core/error.dart';
import 'package:flutter_application_2/Core/internet.dart';
import 'package:flutter_application_2/auth/Data/DataSource/remote.dart';
import 'package:flutter_application_2/auth/Domain/repo/repo.dart';
import '../DataSource/local.dart';

class AuthRepoImp extends AuthRepo {
  AuthRemote remote;
  LocalAuth local;
  NetworkInfo internet;
  AuthRepoImp(
      {required this.remote, required this.local, required this.internet});
  @override
  Future<Either<Failure, User?>> login(
      {required String email, required String password}) async {
    if (await internet.isConnected) {
      final user = await remote.login(email: email, password: password);
      return right(user);
    } else {
      return left(InternetFailure(message: 'No internet Connection'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    if (await internet.isConnected) {
      return Future.value(right(await remote.logout()));
    } else {
      return Future.value(
          left(InternetFailure(message: 'No internet Connection')));
    }
  }

  @override
  Future<Either<Failure, User?>> register(
      {required String email,
      required String password,
      required String username,
      required String phone,
      required bool driver}) async {
    if (await internet.isConnected) {
      return Future.value(right(await remote.register(
          email: email,
          password: password,
          driver: driver,
          phone: phone,
          username: username)));
    } else {
      return Future.value(
          left(InternetFailure(message: 'No internet Connection')));
    }
  }

  @override
  Future<Either<Failure, User?>> signInWithGoogle() async {
    if (await internet.isConnected) {
      return Future.value(right(await remote.signInWithGoogle()));
    } else {
      return Future.value(
          left(InternetFailure(message: 'No internet Connection')));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword(
      {required String currentPassword, required String newPassword}) async {
    if (await internet.isConnected) {
      return Future.value(right(await remote.updatePassword(
          currentPassword: currentPassword, newPassword: newPassword)));
    } else {
      return Future.value(
          left(InternetFailure(message: 'No internet Connection')));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile(
      {required User userupdate}) async {
    if (await internet.isConnected) {
      return Future.value(
          right(await remote.updateProfile(userupdate: userupdate)));
    } else {
      return Future.value(
          left(InternetFailure(message: 'No internet Connection')));
    }
  }
}
