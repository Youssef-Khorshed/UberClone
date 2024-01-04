import 'package:dartz/dartz.dart';
import '../repo/repo.dart';

import '../../../Core/error.dart';

class UpdatePasswordUseCase {
  AuthRepo repo;
  UpdatePasswordUseCase({required this.repo});
  Future<Either<Failure, void>> call(
      {required String currentPassword, required String newPassword}) {
    return repo.updatePassword(
        currentPassword: currentPassword, newPassword: newPassword);
  }
}
