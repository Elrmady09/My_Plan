import 'package:flutter/material.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';

class Button_Task_Details extends StatelessWidget {
  const Button_Task_Details({Key? key, required this.titel, this.color, this.colortitel, this.ontap}) : super(key: key);
  final String titel;
  final Color? color;
  final Color? colortitel;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.03,vertical: size.height * 0.01),
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03,),
          height: size.height * 0.055,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15)
          ),
          child:Center(
            child: GeneralText(
              padding: EdgeInsets.all(0),
              text: titel,
              sizetext: 15,
              fontWeight: FontWeight.w700,
              color: colortitel,
            ),
          ) ,
        ),
      ),
    );
  }
}
