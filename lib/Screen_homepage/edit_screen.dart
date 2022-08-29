import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students/Screen_homepage/student_list/list_student_widget.dart';
import 'package:students/core/button.dart';
import 'package:students/core/colors.dart';
import 'package:students/db/controller/getxcontroller_student_details.dart';
import 'package:students/db/db%20model/data_model.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class EditScreen extends StatelessWidget {
  StudentModel data;
  late RxString image = data.image.obs;
  int? index;
  EditScreen({Key? key, required this.data, required this.index})
      : super(key: key);

  final StudentDetailController _controller =
      Get.put(StudentDetailController());
  final formkey = GlobalKey<FormState>();

  final _name = TextEditingController();

  final _age = TextEditingController();

  final _domain = TextEditingController();

  final _email = TextEditingController();

  final _phone = TextEditingController();
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    _name.text = data.name.toString();
    _email.text = data.email.toString();
    _domain.text = data.classname.toString();
    _phone.text = data.number.toString();
    return Container(
      decoration: baground,
      child: Scaffold(
        appBar: AppBar(
          title: titile(tittle: 'EDIT DETAILS'),
        ),
        body: Form(
          child: ListView(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      final images = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (images == null) {
                        return;
                      } else {
                        final imageTemporary =
                            File(images.path).readAsBytesSync();

                        image.value = base64Encode(imageTemporary);
                      }
                    },
                    child: Obx(() => CircleAvatar(
                          backgroundImage: MemoryImage(
                              const Base64Decoder().convert(image.value)),
                          radius: 50,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Invald Username';
                    } else {
                      return null;
                    }
                  },
                  controller: _name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Invalid email';
                    } else {
                      return null;
                    }
                  },
                  controller: _email,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Invalid domain';
                    } else {
                      return null;
                    }
                  },
                  controller: _domain,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Domain',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Invalid Phone';
                    } else {
                      return null;
                    }
                  },
                  controller: _phone,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Buttons(
                    function: () {
                      checkValidation(data);
                      formkey.currentState?.validate();
                    },
                    label: 'UPDATE'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkValidation(StudentModel data) async {
    final name = _name.text.trim();
    final age = _age.text.trim();
    final domain = _domain.text.trim();
    final phone = _phone.text.trim();
    final email = _email.text.trim();
    final student = StudentModel(
        name: name,
        classname: domain,
        number: phone,
        image: image.value,
        email: email);

    if (name.isEmpty || age.isEmpty || domain.isEmpty || phone.isEmpty) {
      return;
    } else {
      _controller.updateStudent(data.key, student);
      Get.to(const ListStudentWidget());
    }
  }
}
