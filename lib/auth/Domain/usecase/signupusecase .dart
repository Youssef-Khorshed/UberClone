import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repo/repo.dart';
import '../../../../Core/error.dart';

class SignupUseCase {
  AuthRepo repo;
  SignupUseCase({required this.repo});
  Future<Either<Failure, User?>> call(
      {required String email,
      required String password,
      required String username,
      required String phone,
      required bool driver}) async {
    return repo.register(
        email: email,
        password: password,
        driver: driver,
        phone: phone,
        username: username);
  }
}
