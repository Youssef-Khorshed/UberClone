// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/Core/getFailure.dart';
import 'package:flutter_application_2/auth/Presentation/Widgets/home/driverpage.dart';
import 'package:flutter_application_2/auth/Presentation/Widgets/home/userpage.dart';
import 'package:get/get.dart';

import 'package:flutter_application_2/auth/Domain/usecase/signoutusecase.dart';
import 'package:flutter_application_2/auth/Domain/usecase/signupusecase%20.dart';

import '../../Domain/usecase/loginusecase.dart';
import '../../Domain/usecase/sigininGoogle.dart';
import '../../Domain/usecase/updatePasswordusecase.dart';
import '../../Domain/usecase/updateProfileusecase.dart';

class AuthController extends GetxController {
  LoginUseCase loginUseCase;
  SigninGoogleUsecase signinGoogleUsecase;
  SignupUseCase signupUseCase;
  SignOutUseCase signOutUseCase;
  UpdatePasswordUseCase updatePasswordUseCase;
  UpdateProfileUsecase updateProfileUsecase;
  User? user;

  bool checkdriver = false;
  bool loading = false;
  AuthController({
    required this.loginUseCase,
    required this.signinGoogleUsecase,
    required this.signupUseCase,
    required this.signOutUseCase,
    required this.updatePasswordUseCase,
    required this.updateProfileUsecase,
  });
  void switchUser({bool? value}) {
    print('value is $value');
    print('check driver $checkdriver');
    checkdriver = value ?? true;
    update();
  }

  // check Driver
  void change_checkbox(value) {
    checkdriver = value;
    update();
  }

  // login
  void login({required String email, required String password}) async {
    loading = true;
    update();
    final result = await loginUseCase.call(email: email, password: password);

    result.fold((failure) {
      Get.showSnackbar(GetSnackBar(
        title: getfailure(failure: failure),
      ));
      print('faliure is $failure');
    }, (value) {
      user = value;
      update();
      Get.to(() => checkdriver ? UserPage() : DriverPage());
    });
    Timer(const Duration(seconds: 1), () {
      loading = false;
      update();
    });
  }

  // register
  void register(
      {required String email,
      required String password,
      required String username,
      required String phone,
      required bool driver}) async {
    loading = true;
    update();
    final result = await signupUseCase.call(
        email: email,
        password: password,
        driver: driver,
        phone: phone,
        username: username);
    result.fold(
        (failure) => Get.showSnackbar(GetSnackBar(
              message: getfailure(failure: failure),
            )), (value) {
      user = value;
      update();
    });

    Timer(const Duration(seconds: 1), () {
      loading = false;
      update();
    });
  }
  // update

  // forgetpassword

  //clear text
}
