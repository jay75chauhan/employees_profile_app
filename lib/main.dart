import 'package:employee_profile_app/provider/google_sign_in.dart';
import 'package:employee_profile_app/screens/Initial_page.dart';
import 'package:employee_profile_app/screens/add_employee_page.dart';
import 'package:employee_profile_app/screens/home_page.dart';
import 'package:employee_profile_app/screens/login_page.dart';
import 'package:employee_profile_app/screens/signup_page.dart';
import 'package:employee_profile_app/screens/tab_bar.dart';
import 'package:employee_profile_app/screens/update_page.dart';
import 'package:employee_profile_app/utils/routes.dart';
import 'package:employee_profile_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          themeMode: ThemeMode.light,
          theme: MyTheme.lightTheme(),
          darkTheme: MyTheme.darkTheme(),
          routes: {
            "/": (context) => const InitialPage(),
            MyRoutes.loginRoute: (context) => const LoginPage(),
            MyRoutes.signupRoute: (context) => const SignUpPage(),
            MyRoutes.homeRoute: (context) => const HomePage(),
            MyRoutes.addemployee: (context) => const AddEmployee(),
            MyRoutes.mytabs: (context) => const MyTabBar(),
            MyRoutes.updateUser: (context) => const UpdateUser(),
          },
        ));
  }
}
