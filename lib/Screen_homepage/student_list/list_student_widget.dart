import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:students/Screen_homepage/home/home_page.dart';
import 'package:students/Screen_homepage/search/search_screen.dart';
import 'package:students/Screen_homepage/student_list/widgets/details.dart';
import 'package:students/core/button.dart';
import 'package:students/core/colors.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: baground,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: titile(tittle: 'STUDENTS'),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchProfile(),
                  );
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: StudentList(),
          bottomNavigationBar: Buttons(
            label: 'ADD NEW',
            function: () {
              Get.to(AddDetails());
            },
          ),
        ),
      ),
    );
  }
}
