import 'package:flutter/material.dart';
import 'package:flutter_application_2/Core/ReuseableComponent/layout.dart';

class Login_AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final heigt = screen_layout(context: context).height;
    return SliverAppBar(
      expandedHeight: heigt / 2,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          background: Hero(
        child: Image.asset('assets/logo.png'),
        tag: 'logo',
      )),
    );
  }
}
