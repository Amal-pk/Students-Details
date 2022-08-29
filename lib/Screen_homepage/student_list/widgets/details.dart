import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students/Screen_homepage/details_view/show_screen.dart';
import 'package:students/db/controller/getxcontroller_student_details.dart';

class StudentList extends StatelessWidget {
  StudentList({Key? key}) : super(key: key);
  final StudentDetailController _controller =
      Get.put(StudentDetailController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentDetailController>(builder: (studentController) {
      return ListView.separated(
          itemBuilder: (context, index) {
            final data = _controller.studentList[index];
            // log(data.toString());
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: const Color.fromARGB(255, 242, 150, 45),
                child: ListTile(
                  trailing: IconButton(
                    onPressed: () {
                      _controller.deleteStudent(data);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  onTap: () => Get.to(ViewScreen(data: data, index: index)),
                  leading: CircleAvatar(
                      backgroundImage: MemoryImage(
                        const Base64Decoder().convert(data.image),
                      ),
                      radius: 30),
                  title: Text(data.name),
                  subtitle: Text(data.classname),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: _controller.studentList.length);
    });
  }
}
