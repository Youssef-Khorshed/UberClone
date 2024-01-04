import 'package:flutter/material.dart';
import 'package:flutter_application_2/Core/strings.dart';
import 'package:flutter_application_2/Core/theme/theme_cubit.dart';
import 'package:flutter_application_2/auth/Presentation/Widgets/Pageview/pageview.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../auth/Presentation/Widgets/home/home.dart';
import '../auth/Presentation/Widgets/Auth/login/login.dart';
import '../auth/Presentation/Widgets/home/userpage.dart';
import '../auth/Presentation/Widgets/home/driverpage.dart';
import '../auth/Presentation/Widgets/Auth/signup/signup.dart';
import 'applocal.dart';
import 'nextwidget.dart';

class MyApp extends StatelessWidget {
  MyApp();
  @override
  Widget build(BuildContext context) {
    final isPlatformDark =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    final initTheme =
        isPlatformDark ? ThemeCubit.darkTheme : ThemeCubit.lightTheme;
    return GetMaterialApp(
      getPages: [
        GetPage(name: "/", page: () => Home(), middlewares: [AuthMidleware()]),
        GetPage(name: "/login", page: () => LoginPage()),
        GetPage(
          name: '/signup',
          page: () => SignUpPage(),
        ),
        GetPage(
          name: '/pageview',
          page: () => Pageviews(),
        ),
        GetPage(
          name: '/userpage',
          page: () => UserPage(),
        ),
        GetPage(name: '/driverpage', page: () => DriverPage())
      ],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeCubit.lightTheme,
      themeMode: ThemeMode.light, // state ? ThemeMode.light : ThemeMode.dark,
      darkTheme: ThemeCubit.darkTheme,
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      // ignore: prefer_const_literals_to_create_immutables

      supportedLocales: const [
        Locale("en", ""), // English
        Locale("ar", ""), // arabic
      ],

      localeResolutionCallback: (currentLang, supportLang) {
        if (currentLang != null) {
          for (Locale locale in supportLang) {
            if (locale.languageCode == currentLang.languageCode) {
              currentLang.languageCode == "ar"
                  ? applang = "ar"
                  : applang = "en";

              return currentLang;
            }
          }
        }
        return supportLang.first;
      },
      // locale: Locale(applang, ''),
    );
  }
}

class RestartWidget extends StatefulWidget {
  RestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
