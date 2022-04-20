// ignore_for_file: unnecessary_string_interpolations

import 'package:employee_profile_app/model/data.dart';
import 'package:employee_profile_app/utils/routes.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  final Item item;

  const ProfileCard({Key key, this.item}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
          splashColor: Colors.deepPurple,
          onTap: () {
            Navigator.pushNamed(
              context,
              MyRoutes.updateUser,
              arguments: widget.item,
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                '${widget.item?.employeeName}',
                style:
                    const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Department:${widget.item?.department}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Employee${widget.item?.department}',
                style: const TextStyle(fontSize: 18),
              ),
            ]),
          )),
    );
  }
}
