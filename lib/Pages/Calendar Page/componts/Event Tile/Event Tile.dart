import 'package:flutter/material.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';


class EventTile extends StatelessWidget {
  final String time;
  final String title;
  final Color color;

  const EventTile({
    required this.time,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.width * 0.015),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05 , vertical: size.height * 0.018),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          GeneralText(
            padding: EdgeInsets.all(0),
           text:  time,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(width: 20),
          GeneralText(
              padding: EdgeInsets.all(0),
              text: title
          ),
        ],
      ),
    );
  }
}