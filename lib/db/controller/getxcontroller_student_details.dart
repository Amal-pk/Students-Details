import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:students/db/db%20model/data_model.dart';

class StudentDetailController extends GetxController {
  final Box<StudentModel> studentDB = Hive.box('student_db');
  List<StudentModel> studentList = [];
  @override
  void onInit() {
    _getStudent();
    super.onInit();
  }

  _getStudent() {
    Hive.openBox('student_db');

    studentList = studentDB.values.toList();
    update();
  }

  addStudent(StudentModel student) {
    studentDB.add(student);
    _getStudent();
    update();
  }

  updateStudent(var key, StudentModel value) {
    studentDB.put(key, value);
    _getStudent();
    update();
  }

  deleteStudent(StudentModel value) {
    studentDB.delete(value);
    _getStudent();
    update();
  }
}
