import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'globalObjects.dart';

class AuthMidleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    final role = preferences.getString('role');
    // if (role == 'none' || role == null) {
    //   return const RouteSettings(name: "/login");
    // } else if (role == 'Admin') {
    //   return const RouteSettings(name: "/signoutAdmin");
    // } else if (role == 'User') {
    //   return const RouteSettings(name: '/signoutUser');
    // }

    //
    switch (role) {
      case 'login':
        return const RouteSettings(name: '/login');
      case 'driver':
        return const RouteSettings(name: '/driverpage');
      case 'user':
        return const RouteSettings(name: '/userpage');

      default:
        return const RouteSettings(name: '/pageview');
    }
  }
}
