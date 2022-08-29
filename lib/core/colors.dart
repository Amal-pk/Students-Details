import 'package:flutter/material.dart';

Text titile({required String tittle}) {
  return Text(
    tittle,
    style: const TextStyle(
        fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 3),
  );
}

const Decoration baground = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 220, 162, 91),
      Colors.white,
    ],
  ),
);
const themeColor = Color.fromARGB(255, 242, 150, 45);

const height40 = SizedBox(height: 40);
