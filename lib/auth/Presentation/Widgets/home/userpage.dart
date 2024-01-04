// ignore: file_names
import 'package:flutter/material.dart';
import '../../../../Core/globalObjects.dart';
import 'home.dart';
import 'package:get/get.dart';
import '../../Logic/authlogic.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key});
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
                  Get.off(Home());
                },
                child: Text('Signout user')),
          ],
        ),
      ),
    );
  }
}
