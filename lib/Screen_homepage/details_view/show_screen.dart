import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:students/Screen_homepage/details_view/widgets/cards.dart';
import 'package:students/Screen_homepage/edit_screen.dart';
import 'package:students/core/colors.dart';
import 'package:students/db/db%20model/data_model.dart';

class ViewScreen extends StatelessWidget {
  StudentModel data;
  int? index;
  ViewScreen({Key? key, required this.data, required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: baground,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage:
                      MemoryImage(const Base64Decoder().convert(data.image)),
                  radius: 120,
                ),
              ),
              CardsWidget(
                item: data.name,
              ),
              CardsWidget(
                item: data.number,
              ),
              CardsWidget(
                item: data.email,
              ),
              CardsWidget(
                item: data.classname,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: themeColor,
          onPressed: () => Get.to(EditScreen(data: data, index: index)),
          child: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
