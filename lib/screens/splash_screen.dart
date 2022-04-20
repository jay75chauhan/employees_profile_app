import 'dart:async';

import 'package:employee_profile_app/utils/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2),
        () => Navigator.pushNamed(context, MyRoutes.loginRoute));
    return Scaffold(
      body: Center(
        child: Container(child: CircularProgressIndicator()),
      ),
    );
  }
}
