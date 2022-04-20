// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_profile_app/global/globals.dart' as global;
import 'package:employee_profile_app/model/data.dart';
import 'package:employee_profile_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final _formKey = GlobalKey<FormState>();
  Item item;

  @override
  void initState() {
    super.initState();
    item = Item();
    item.id = Uuid().v4();
  }

  addEmployeeState() async {
    if (_formKey.currentState.validate()) {
      final prefs = await SharedPreferences.getInstance();
      prefs.getStringList('employee');

      await FirebaseFirestore.instance
          .collection('employee')
          .doc(item.id)
          .set(item.toJson())
          .then((value) => Fluttertoast.showToast(
              msg: "Employee Added Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black87,
              textColor: Colors.white,
              fontSize: 16.0))
          .then((e) => Navigator.pushNamed(context, MyRoutes.homeRoute));

      // global.item.add(item);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
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
                      addEmployeeState();
                    },
                    child: const Text(
                      'Submit',
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
