import 'package:flutter/material.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';


class LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  final String percentage;

  const LegendItem({
    required this.color,
    required this.text,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.01),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          GeneralText(
            padding: EdgeInsets.zero,
            text: text,
            sizetext:15 ,
            fontWeight: FontWeight.w500,
          ),
          const Spacer(),
          Text(percentage),
        ],
      ),
    );
  }
}