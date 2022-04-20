import 'package:employee_profile_app/screens/home_page.dart';
import 'package:employee_profile_app/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key key}) : super(key: key);

  // @override
  // void initState() {
  //   // _loadUserInfo();
  //   super.initState();
  // }

  // _loadUserInfo() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _username = (prefs.getString('username') ?? "");
  //   if (_username == "") {
  //     Navigator.pushNamedAndRemoveUntil(context, MyRoutes.loginRoute,
  //         ModalRoute.withName(MyRoutes.loginRoute));
  //   } else {
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, MyRoutes.homeRoute, ModalRoute.withName(MyRoutes.homeRoute));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error Occured"));
        } else if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    ));
  }
}
