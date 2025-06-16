import 'package:flutter/material.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';

class Last_Updated extends StatelessWidget {
  const Last_Updated({Key? key, this.dateandtime}) : super(key: key);
  final String? dateandtime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.02,vertical: size.height * 0.02),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03,vertical: size.height * 0.02),
      width: size.width * 0.4,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey,Colors.white, Colors.grey.shade300,Colors.blueGrey,],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15), // 🔹 لون الظل
            blurRadius: 50, // 🔹 مدى نعومة الظل
            spreadRadius: 5, // 🔹 مدى انتشار الظل
            offset: Offset(0, 4), // 🔹 موقع الظل
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.update, color: Colors.teal),
          GeneralText(
            padding: EdgeInsets.only(top: size.height * 0.01),
            text: 'Last Updated',
            sizetext: 18,
            fontWeight: FontWeight.w700,
          ),
          GeneralText(
            padding: EdgeInsets.only(top: size.height * 0.01),
            text: 'Last updated: $dateandtime ',
            sizetext: 12,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
