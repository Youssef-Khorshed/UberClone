import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Logic/authlogic.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
