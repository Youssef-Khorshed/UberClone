import 'package:dio/dio.dart';
import 'package:flutter_application_2/Core/internet.dart';
import 'package:flutter_application_2/auth/Data/DataSource/local.dart';
import 'package:flutter_application_2/auth/Data/DataSource/remote.dart';
import 'package:flutter_application_2/auth/Data/RepoImp/AuthrepoImp.dart';
import 'package:flutter_application_2/auth/Domain/repo/repo.dart';
import 'package:flutter_application_2/auth/Domain/usecase/loginusecase.dart';
import 'package:flutter_application_2/auth/Domain/usecase/sigininGoogle.dart';
import 'package:flutter_application_2/auth/Domain/usecase/signoutusecase.dart';
import 'package:flutter_application_2/auth/Domain/usecase/signupusecase%20.dart';
import 'package:flutter_application_2/auth/Domain/usecase/updatePasswordusecase.dart';
import 'package:flutter_application_2/auth/Domain/usecase/updateProfileusecase.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/Presentation/Logic/authlogic.dart';
import 'app.dart';
import 'globalObjects.dart';

final db = GetIt.instance;

Future<void> init() async {
  //factory
  db.registerFactory(() => AuthController(
      loginUseCase: db(),
      signOutUseCase: db(),
      signinGoogleUsecase: db(),
      signupUseCase: db(),
      updatePasswordUseCase: db(),
      updateProfileUsecase: db()));

  /// usecases
  db.registerLazySingleton(() => LoginUseCase(repo: db()));
  db.registerLazySingleton(() => SignOutUseCase(repo: db()));
  db.registerLazySingleton(() => SignupUseCase(repo: db()));
  db.registerLazySingleton(() => SigninGoogleUsecase(repo: db()));
  db.registerLazySingleton(() => UpdatePasswordUseCase(repo: db()));
  db.registerLazySingleton(() => UpdateProfileUsecase(repo: db()));

  /// DataSource
  db.registerLazySingleton<AuthRepo>(
      () => AuthRepoImp(internet: db(), local: db(), remote: db()));
  db.registerLazySingleton<LocalAuth>(
      () => LocalAuthImp(sharedPreferences: db()));
  db.registerLazySingleton<AuthRemote>(() => AuthRemoteImp(dio: db()));
  db.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: db()));

  //object intalization
  preferences = await SharedPreferences.getInstance();

  //Object registeration
  db.registerLazySingleton(() => preferences);
  db.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  db.registerLazySingleton(() => Dio(BaseOptions()));
  db.registerLazySingleton(() => MyApp());
  db.registerLazySingleton(() => firestore);
  Get.lazyPut(() => db<AuthController>());
}
