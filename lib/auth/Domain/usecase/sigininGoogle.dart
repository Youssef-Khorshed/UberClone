import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/auth/Domain/repo/repo.dart';
import '../../../Core/error.dart';

class SigninGoogleUsecase {
  AuthRepo repo;
  SigninGoogleUsecase({required this.repo});
  Future<Either<Failure, User?>> call() {
    return repo.signInWithGoogle();
  }
}
