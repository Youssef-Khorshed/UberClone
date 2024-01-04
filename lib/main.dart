// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Core/theme/firebaseoption.dart';
import 'Core/app.dart';
import 'Core/depndancyinjection.dart' as db;
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  await intialization();

  runApp(RestartWidget(child: MyApp()));
}

Future<void> intialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    Firebase.initializeApp(),
    db.init()
  ]);
  await FirebaseAppCheck.instance.activate(
      webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
      androidProvider: AndroidProvider.debug,
      appleProvider: AppleProvider.appAttest);
}
