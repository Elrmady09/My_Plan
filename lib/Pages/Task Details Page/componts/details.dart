import 'package:flutter/material.dart';
import 'package:my_plan/Genral%20Widget/Decoration/Decoration.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Genral%20Widget/Header/Header.dart';
import 'package:my_plan/Pages/componts/Description%20Box/Description%20Box.dart';
import 'package:my_plan/Pages/componts/Titel%20Box/Titel%20Box.dart';


class Details extends StatelessWidget {
  const Details({Key? key, required this.title, required this.state, this.ontap}) : super(key: key);
  final String title;
  final String state;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:  EdgeInsets.only(top: size.height * 0.015,left: size.width * 0.06,right: size.width * 0.06),
      child: GestureDetector(
        onTap:ontap,
        child: Row(
          children: [
            GeneralText(
              padding: EdgeInsets.all(0),
              text: title,
              sizetext: 14,
              fontWeight: FontWeight.w500,
            ),
            Spacer(),
            GeneralText(
              padding: EdgeInsets.all(0),
              text: state,
              sizetext: 14,
              fontWeight: FontWeight.w500,
            ),


          ],
        ),
      ),
    );
  }
}
