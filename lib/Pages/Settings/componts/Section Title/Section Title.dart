import 'package:flutter/material.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return GeneralText(
      padding: EdgeInsets.only(bottom: 12.0),
      text: title,
      sizetext: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );
  }
}