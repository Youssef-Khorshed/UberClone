import 'package:flutter/material.dart';
import 'package:flutter_application_2/Core/globalObjects.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../../../Core/ReuseableComponent/navigation.dart';
import '../../../../../../../../Core/strings.dart';
import '../../../../Core/applocal.dart';
import '../Auth/login/login.dart';

class Pageview_component {
  static List<AssetImage> images = [
    AssetImage(
      'assets/p1.png',
    ),
    AssetImage(
      'assets/p2.png',
    ),
    AssetImage(
      'assets/p3.png',
    )
  ];

  static TextButton skip_btn({required BuildContext context}) {
    return TextButton(
        onPressed: () async {
          await preferences.setString('role', 'login');
          // ignore: use_build_context_synchronously
          Get.off(LoginPage());
        },
        child: Text(
          getLang(context: context, key: "skip")!,
          style: const TextStyle(color: Colors.amber, fontSize: 25),
        ));
  }
}
