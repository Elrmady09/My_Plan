import 'package:flutter/material.dart';
import 'package:my_plan/Colors/Colors.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';


class Card_NewTask extends StatelessWidget {
  const Card_NewTask({Key? key, this.iconwidget, this.paddingright, required this.iconData, required this.titel, required this.titeldetials, this.ontap}) : super(key: key);
  final Widget? iconwidget;
  final double? paddingright;
  final IconData iconData;
  final String titel;
  final String titeldetials;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.015,left: size.width * 0.05,right: paddingright ?? size.width * 0.07),
      child: GestureDetector(
        onTap: ontap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              height: size.height * 0.065,
              decoration: BoxDecoration(
                  color: PrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1), // 🔹 لون الظل
                      blurRadius: 20, // 🔹 مدى نعومة الظل
                      spreadRadius: 15, // 🔹 مدى انتشار الظل
                      offset: Offset(0, 4), // 🔹 موقع الظل
                    ),
                  ]
              ),
              child: Icon(iconData,size: 24,color: Colors.white,),
            ),
            GeneralText(
              padding: EdgeInsets.only(top: size.height * 0.00,left: size.width * 0.05),
              text: titel,
              sizetext: 20,
              fontWeight: FontWeight.w700,
            ),
            Spacer(),
            Row(
              children: [
                GeneralText(
                  padding: EdgeInsets.only(top: size.height * 0,),
                  text: titeldetials,
                  sizetext: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                if (iconwidget != null) iconwidget!,
              ],
            ),



          ],
        ),
      ),
    );
  }
}
