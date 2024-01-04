import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../Core/error.dart';
import '../repo/repo.dart';

class LoginUseCase {
  AuthRepo repo;
  LoginUseCase({required this.repo});
  Future<Either<Failure, User?>> call(
      {required String email, required String password}) async {
    return repo.login(email: email, password: password);
  }
}
