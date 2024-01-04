import 'package:dartz/dartz.dart';

import '../../../Core/error.dart';
import '../repo/repo.dart';

class SignOutUseCase {
  AuthRepo repo;
  SignOutUseCase({required this.repo});
  Future<Either<Failure, void>> call() async {
    return repo.logout();
  }
}
