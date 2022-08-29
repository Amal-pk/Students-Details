import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:students/Screen_homepage/home/widget/image.dart';
import 'package:students/Screen_homepage/home/widget/text_box_style.dart';
import 'package:students/core/button.dart';
import 'package:students/core/colors.dart';
import 'package:students/db/controller/getxcontroller_student_details.dart';
import 'package:students/db/db%20model/data_model.dart';
import 'dart:io';

import '../student_list/list_student_widget.dart';

class AddDetails extends StatelessWidget {
  AddDetails({super.key});

  final formkey = GlobalKey<FormState>();

  final _username = TextEditingController();

  final _domain = TextEditingController();

  final _email = TextEditingController();

  final TextEditingController _phone = TextEditingController();

  final ImagePicker picker = ImagePicker();

  RxString _image = ''.obs;
  final StudentDetailController _studentsController =
      Get.put(StudentDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          height40,
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "A D D S T U D E N T",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 113, 76, 20)),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final image =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (image == null) {
                return;
              } else {
                final imageTemporary = File(image.path).readAsBytesSync();

                _image.value = base64Encode(imageTemporary);
              }
            },
            child: AddImage(
              image: _image,
            ),
          ),
          IconButton(
            onPressed: () => Get.to(const ListStudentWidget()),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          Form(
            key: formkey,
            child: Column(
              children: [
                TextFields(
                  name: 'Name',
                  controler: _username,
                  keybord: TextInputType.name,
                ),
                TextFields(
                  name: 'Mobile',
                  controler: _phone,
                  keybord: TextInputType.number,
                ),
                TextFields(
                  name: 'Domain',
                  controler: _domain,
                  keybord: TextInputType.name,
                ),
                TextFields(
                  name: 'email',
                  controler: _email,
                  keybord: TextInputType.name,
                ),
              ],
            ),
          ),
          Buttons(
              function: () {
                if (formkey.currentState!.validate()) {
                  checkValidation();
                }
              },
              label: 'Submit'),
        ],
      ),
    );
  }

  Positioned stacks(
      {required double l,
      required double w,
      required double h,
      required String img}) {
    return Positioned(
      left: l,
      width: w,
      height: h,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(img),
          ),
        ),
      ),
    );
  }

  checkValidation() {
    final name = _username.text.trim();
    final email = _email.text.trim();
    final domain = _domain.text.trim();
    final phone = _phone.text.trim();
    final student = StudentModel(
        email: email,
        name: name,
        classname: domain,
        number: phone,
        image: _image.value);
    if (name.isEmpty ||
        email.isEmpty ||
        domain.isEmpty ||
        phone.isEmpty ||
        _image.isEmpty) {
      Get.snackbar("", "Showed");
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     behavior: SnackBarBehavior.floating,
      //     backgroundColor: themeColor,
      //     content: Text('All Field Required'),
      //   ),
      // );
    } else {
      _studentsController.addStudent(student);
      Get.to(const ListStudentWidget());
    }
  }
}
