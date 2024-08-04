import 'package:flutter/material.dart';

class Gendericon extends StatelessWidget {
  Gendericon({required this.gendericon, required this.gendertype});

  final IconData gendericon;
  final String gendertype;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        gendericon,
        size: 80.0,
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        gendertype,
        style: TextStyle(
          fontSize: 18.0,
          color: Color(0xFF8D8E98),
        ),
      )
    ]);
  }
}
