import 'package:flutter/material.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Genral%20Widget/space/space.dart';


class Image_Task_Details extends StatelessWidget {
  const Image_Task_Details({Key? key, required this.image, this.ontap}) : super(key: key);
  final ImageProvider image;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.02,vertical: size.height * 0.02),
        width: size.width * 0.4,
        height: size.height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15), // 🔹 لون الظل
              blurRadius: 50, // 🔹 مدى نعومة الظل
              spreadRadius: 5, // 🔹 مدى انتشار الظل
              offset: Offset(0, 4), // 🔹 موقع الظل
            ),
          ],
          border: Border.all(color: Colors.white.withOpacity(0.5)),

        ),
        child: Stack(
          children: [
            Container(
              width: size.width ,
              height: size.height ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15), // 🔹 لون الظل
                    blurRadius: 50, // 🔹 مدى نعومة الظل
                    spreadRadius: 5, // 🔹 مدى انتشار الظل
                    offset: Offset(0, 4), // 🔹 موقع الظل
                  ),
                ],
                border: Border.all(color: Colors.white.withOpacity(0.5)),
                image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Center(
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 40,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class Image_Task_Details_Add extends StatelessWidget {
  const Image_Task_Details_Add({Key? key, this.image}) : super(key: key);
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.02,vertical: size.height * 0.02),
      width: size.width * 0.4,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
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
        border: Border.all(color: Colors.white.withOpacity(0.5)),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GeneralText(
            text: 'Add Photo',
            sizetext: 18,
            fontWeight: FontWeight.w700,
          ),
          HeightSpace(space: 0.01),
          Icon(Icons.add_photo_alternate_outlined),

        ],
      ),
    );
  }
}
