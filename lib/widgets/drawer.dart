// ignore_for_file: unnecessary_const

import 'package:employee_profile_app/provider/google_sign_in.dart';
import 'package:employee_profile_app/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final auth = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.deepPurple,
      child: Column(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName:
                      Text(auth.displayName != null ? auth.displayName : ''),
                  accountEmail: Text(auth.email),
                  currentAccountPicture: CircleAvatar(
                      // backgroundImage: NetworkImage(auth.photoURL),
                      ))),
          const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Home",
                textScaleFactor: 1.2,
                style: const TextStyle(color: Colors.white),
              )),
          const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              )),
          const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email Me",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              )),
          ListTile(
              onTap: () => {Navigator.pushNamed(context, MyRoutes.mytabs)},
              leading: const Icon(
                CupertinoIcons.layers,
                color: Colors.white,
              ),
              title: const Text(
                "Tab Bar",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              )),
          ListTile(
              onTap: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();

                Navigator.pushNamed(context, MyRoutes.initialRoute);
              },
              leading: const Icon(
                CupertinoIcons.backward_end,
                color: Colors.white,
              ),
              title: const Text(
                "sign Out",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    ));
  }
}
