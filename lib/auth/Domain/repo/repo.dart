import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../Core/error.dart';

abstract class AuthRepo {
  Future<Either<Failure, User?>> login(
      {required String email, required String password});
  Future<Either<Failure, User?>> register(
      {required String email,
      required String password,
      required String username,
      required String phone,
      required bool driver});
  Future<Either<Failure, void>> updateProfile({required User userupdate});
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> updatePassword(
      {required String currentPassword, required String newPassword});
  Future<Either<Failure, User?>> signInWithGoogle();
}
