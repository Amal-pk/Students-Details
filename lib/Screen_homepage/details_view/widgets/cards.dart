import 'package:flutter/material.dart';
import 'package:students/core/colors.dart';

class CardsWidget extends StatelessWidget {
  final String item;
  const CardsWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: double.infinity,
        height: 60,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: themeColor, blurRadius: 20, offset: Offset(0, 10))
            ]),
        child: Center(
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
