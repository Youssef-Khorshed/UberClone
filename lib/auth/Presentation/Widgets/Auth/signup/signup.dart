// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Core/depndancyinjection.dart' as db;
import 'package:flutter_application_2/auth/Presentation/Widgets/Auth/signup/signup_body.dart';
import 'package:flutter_application_2/auth/Presentation/Widgets/Auth/signup/signup_header.dart';
import 'package:get/get.dart';
import '../../../Logic/authlogic.dart';

class SignUpPage extends StatelessWidget {
  String? title;
  SignUpPage({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => db.db<AuthController>());
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            Signup_AppBar(),
            Signup_Body(),
          ],
        ),
      ),
    );
  }
}
