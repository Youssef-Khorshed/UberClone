import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repo/repo.dart';
import '../../../../Core/error.dart';

class UpdateProfileUsecase {
  AuthRepo repo;
  UpdateProfileUsecase({required this.repo});
  Future<Either<Failure, void>> call({required User userupdate}) async {
    return repo.updateProfile(userupdate: userupdate);
  }
}
