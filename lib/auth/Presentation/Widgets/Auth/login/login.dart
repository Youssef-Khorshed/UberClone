// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Core/depndancyinjection.dart' as db;
import 'package:flutter_application_2/auth/Presentation/Widgets/Auth/login/login_body.dart';
import 'package:get/get.dart';
import '../../../../../Core/applocal.dart';
import '../../../../../Core/strings.dart';
import '../../../Logic/authlogic.dart';
import 'login_header.dart';

class LoginPage extends StatelessWidget {
  String? title;
  LoginPage({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => db.db<AuthController>());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Login_AppBar(),
          Login_Body(),
        ],
      ),
    );
  }
}
