import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_profile_app/global/globals.dart';
import 'package:employee_profile_app/model/data.dart';
import 'package:employee_profile_app/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({Key key}) : super(key: key);

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final _formKey = GlobalKey<FormState>();
  Item item;

  @override
  void initState() {
    super.initState();
    item = Item();
  }

  @override
  Widget build(BuildContext context) {
    item = ModalRoute.of(context).settings.arguments as Item;

    updateUserState() async {
      if (_formKey.currentState.validate()) {
        // final prefs = await SharedPreferences.getInstance();
        // prefs.getStringList('employee');

        try {
          await FirebaseFirestore.instance
              .collection('employee')
              .doc(item.id)
              .update(item.toJson())
              .then((value) => Fluttertoast.showToast(
                  msg: "Employee Data Updated Successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black87,
                  textColor: Colors.white,
                  fontSize: 16.0))
              .then((e) => Navigator.pushNamed(context, MyRoutes.homeRoute));
        } catch (e) {
          print(e);
        }
        // global.item.add(item);

      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Employee Data'),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    initialValue: item.employeeName,
                    onChanged: (value) {
                      item.employeeName = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Employee Name',
                      hintText: " Enter Employee Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Value';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    initialValue: item.department,
                    onChanged: (value) {
                      item.department = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Department',
                      hintText: "Enter your Department",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Value';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    initialValue: item.designation,
                    onChanged: (value) {
                      item.designation = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Designation',
                      hintText: "Enter Designation",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Value';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    initialValue: item.contactNo,
                    maxLength: 10,
                    onChanged: (value) {
                      item.contactNo = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Contact No',
                      hintText: "Enter your Contact No",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Value';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    initialValue: item.joiningDate,
                    onChanged: (value) {
                      item.joiningDate = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Joining Date',
                      hintText: "Enter Joining Date",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Value';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    initialValue: item.reportingManager,
                    onChanged: (value) {
                      item.reportingManager = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Reporting Manager',
                      hintText: "Enter Reporting Manager Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Value';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextButton(
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
                      updateUserState();
                    },
                    child: const Text(
                      'Update',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ]),
              )),
        ),
      ),
    );
  }
}
