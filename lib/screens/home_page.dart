import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_profile_app/model/data.dart';
import 'package:employee_profile_app/utils/routes.dart';
import 'package:employee_profile_app/widgets/drawer.dart';
import 'package:employee_profile_app/widgets/profileCard.dart';
import 'package:flutter/material.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:employee_profile_app/global/globals.dart' as global;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // ignore: prefer_typing_uninitialized_variables

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Flexible(
                  flex: 8,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('employee')
                        .snapshots(),
                    // ignore: missing_return
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.docs.length > 0) {
                          return ListView.builder(
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              return ProfileCard(
                                item: Item.fromJson(
                                    snapshot.data.docs[index].data()),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: EmptyWidget(
                              image: null,
                              packageImage: PackageImage.Image_4,
                              title: 'No Employee Data',
                              subTitle: 'please add employee data',
                              titleTextStyle: const TextStyle(
                                fontSize: 22,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w500,
                              ),
                              subtitleTextStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.deepPurple,
                              ),
                            ),
                          );
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )),
              Flexible(
                flex: 1,
                child: TextButton(
                  style: TextButton.styleFrom(
                      elevation: 10,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      primary: Colors.white,
                      backgroundColor: Colors.deepPurple // foreground
                      ),
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.addemployee);
                  },
                  child: const Text(
                    'Add Employee',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        selectedItemColor: Colors.deepPurple,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
