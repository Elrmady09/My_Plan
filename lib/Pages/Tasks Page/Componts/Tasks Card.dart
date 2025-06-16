import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_plan/Colors/Colors.dart';
import 'package:my_plan/Genral%20Widget/Decoration/Decoration.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Genral%20Widget/space/space.dart';
import 'package:my_plan/Pages/Task%20Details%20Page/Task%20Details%20Page.dart';

class Tasks_Card extends StatelessWidget {
  const Tasks_Card({Key? key,  this.time, required this.task_titel, required this.task_details, required this.task_state, required this.task_image,  this.icon_state, this.ontap}) : super(key: key);
  final DateTime? time;
  final String task_titel;
  final String task_details;
  final String task_state;
  final String task_image;
  final IconData? icon_state;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06,vertical: size.height * 0.02),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.02,vertical: size.height * 0.005),
        width: size.width,
        //height: size.height * 0.19,
        decoration: BoxDecoration(
            //color: Colors.white,
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15), // 🔹 لون الظل
                blurRadius: 50, // 🔹 مدى نعومة الظل
                spreadRadius: 5, // 🔹 مدى انتشار الظل
                offset: Offset(0, 4), // 🔹 موقع الظل
              ),
            ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (time != null)
                  GeneralText(
                      padding: EdgeInsets.only(top: size.height * 0.001,),
                      text: DateFormat('yyyy-MM-dd – HH:mm').format(time!),
                      sizetext: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                  ),
                if (task_titel.isNotEmpty)
                  GeneralText(
                    padding: EdgeInsets.only(top: size.height * 0.001,),
                    text: task_titel,
                    sizetext: 16,
                    fontWeight: FontWeight.w700,

                ),
                if (task_details.isNotEmpty)
                  SizedBox(
                    width: size.width * 0.45,
                    child: GeneralText(
                      padding: EdgeInsets.only(top: size.height * 0.001,),
                      text: task_details,
                      sizetext: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                if (task_state.isNotEmpty && icon_state != null )
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.02),
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    height: size.height * 0.055,
                    decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1), // 🔹 لون الظل
                            blurRadius: 20, // 🔹 مدى نعومة الظل
                            spreadRadius: 15, // 🔹 مدى انتشار الظل
                            offset: Offset(0, 4), // 🔹 موقع الظل
                          ),
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GeneralText(
                          padding: EdgeInsets.only(top: size.height * 0.001,),
                          text: task_state,
                          sizetext: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        WidthSpace(space: 0.01,),
                        Icon(icon_state,color: Colors.white,),

                    ],
                  ),
                )
                else
                const SizedBox.shrink(),




              ],
            ),
            Spacer(),
            if (task_image.isNotEmpty)
              Container(
                width: size.width * 0.32,
                height: size.height * 0.17,
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
                    image: task_image.startsWith('assets/')
                        ? AssetImage(task_image) as ImageProvider
                        : FileImage(File(task_image)),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              const SizedBox.shrink(),


          ],
        ),
      ),
    );
  }
}






















// class Tasks_Card extends StatelessWidget {
//   const Tasks_Card({Key? key,  this.time, required this.task_titel, required this.task_details, required this.task_state, required this.task_image,  this.icon_state, this.ontap}) : super(key: key);
//   final DateTime? time;
//   final String task_titel;
//   final String task_details;
//   final String task_state;
//   final String task_image;
//   final IconData? icon_state;
//   final VoidCallback? ontap;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return GestureDetector(
//       onTap: ontap,
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: size.width * 0.06,vertical: size.height * 0.01),
//         margin: EdgeInsets.symmetric(horizontal: size.width * 0.02,vertical: size.height * 0.005),
//         width: size.width,
//         //height: size.height * 0.19,
//         decoration: BoxDecoration(
//           //borderRadius: BorderRadius.circular(15),
//             border: Border(
//               bottom: BorderSide(
//                 color: Colors.grey.shade300,
//                 width: 2,
//               ),
//             )
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (time != null)
//                   GeneralText(
//                     padding: EdgeInsets.only(top: size.height * 0.001,),
//                     text: DateFormat('yyyy-MM-dd – HH:mm').format(time!),
//                     sizetext: 13,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.grey,
//                   ),
//                 if (task_titel.isNotEmpty)
//                   GeneralText(
//                     padding: EdgeInsets.only(top: size.height * 0.001,),
//                     text: task_titel,
//                     sizetext: 16,
//                     fontWeight: FontWeight.w700,
//
//                   ),
//                 if (task_details.isNotEmpty)
//                   GeneralText(
//                     padding: EdgeInsets.only(top: size.height * 0.001,),
//                     text: task_details,
//                     sizetext: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.grey,
//                   ),
//                 if (task_state.isNotEmpty && icon_state != null )
//                   Container(
//                     margin: EdgeInsets.only(top: size.height * 0.02),
//                     padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
//                     height: size.height * 0.055,
//                     decoration: BoxDecoration(
//                         color: PrimaryColor,
//                         borderRadius: BorderRadius.circular(15),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1), // 🔹 لون الظل
//                             blurRadius: 20, // 🔹 مدى نعومة الظل
//                             spreadRadius: 15, // 🔹 مدى انتشار الظل
//                             offset: Offset(0, 4), // 🔹 موقع الظل
//                           ),
//                         ]
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GeneralText(
//                           padding: EdgeInsets.only(top: size.height * 0.001,),
//                           text: task_state,
//                           sizetext: 14,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white,
//                         ),
//                         WidthSpace(space: 0.01,),
//                         Icon(icon_state,color: Colors.white,),
//
//                       ],
//                     ),
//                   )
//                 else
//                   const SizedBox.shrink(),
//
//
//
//
//               ],
//             ),
//             Spacer(),
//             if (task_image.isNotEmpty)
//               Container(
//                 margin: EdgeInsets.only(top: size.height * 0.015),
//                 width: size.width * 0.32,
//                 height: size.height * 0.17,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   image: DecorationImage(
//                     image: task_image.startsWith('assets/')
//                         ? AssetImage(task_image) as ImageProvider
//                         : FileImage(File(task_image)),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               )
//             else
//               const SizedBox.shrink(),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }