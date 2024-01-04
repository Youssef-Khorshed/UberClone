import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/globalObjects.dart';
import '../../Logic/authlogic.dart';
import '../Auth/login/login.dart';

class DriverPage extends StatelessWidget {
  DriverPage({super.key});
  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () async {
                  await preferences.setString('role', 'none');
                  Get.offAll(LoginPage());
                },
                child: Text('Signout driver')),
          ],
        ),
      ),
    );
  }
}
