import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getx_student_app/controller/provider.dart';
import 'package:getx_student_app/models/hive_model.dart';
import 'package:getx_student_app/screens/edit_student.dart';
import 'package:provider/provider.dart';

import '../my widgets/widgets.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({Key? key,required this.details }) : super(key: key);
 final StudentModel details;
  @override
  Widget build(BuildContext context) {
    ProviderModel model = Provider.of<ProviderModel>(context,listen: false);
    return Scaffold(
     
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Student Details 🧑',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
               CircleAvatar(
                radius: 100,
                backgroundImage: MemoryImage(const Base64Decoder().convert(details.imagString)),
              ),
               NameCard(
                data: details.name,
                item: 'name',
              ),
              NameCard(
                data: details.age,
                item: 'Age',
              ),
               NameCard(
                data: details.place,
                item: 'Place',
              ),
               NameCard(data: details.phone, item: 'Phone'),
              IconButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditStudent(data: details),));}, icon: const Icon(Icons.edit)),
            ],
          ),
        ),
      ),
    );
  }
}
