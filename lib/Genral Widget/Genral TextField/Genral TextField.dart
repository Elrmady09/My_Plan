import 'package:flutter/material.dart';


class Genral_TextField extends StatelessWidget {
  const Genral_TextField({Key? key, this.title, this.boxShadow, this.textEditingController, this.onSubmitted, this.onchanged, this.focusNode, this.ontap, this.height_textfield, this.maxlines, this.colortextfield}) : super(key: key);
  final String? title;
  final List<BoxShadow>? boxShadow;
  final TextEditingController? textEditingController;
  final Function(String)? onSubmitted;
  final Function(String)? onchanged;
  final FocusNode? focusNode;
  final VoidCallback? ontap;
  final double? height_textfield;
  final int? maxlines;
  final Color? colortextfield;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      width: size.width * 0.87,
      height: height_textfield ??  size.height * 0.085 , // 90% of screen width
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05,vertical: size.height * 0.015),
      decoration: BoxDecoration(
        color: colortextfield ?? Colors.grey.shade100, // Light background color
        borderRadius: BorderRadius.circular(15),
        boxShadow: boxShadow// Rounded corners
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: size.width * 0.02), // Space between icon and text
          Expanded(
            child: TextField(
              controller: textEditingController,
              textInputAction: TextInputAction.search,
              onSubmitted:onSubmitted ,
              onChanged:onchanged ,
              focusNode: focusNode,
              onTap: ontap,
              maxLines: maxlines,
              decoration: InputDecoration(
                hintText: "$title",
                hintStyle: TextStyle(color: Colors.grey.shade500), // Light text color
                border: InputBorder.none, // Removes underline
              ),
            ),
          ),
          // Separator ( | )
          // Container(
          //   height: 24, // Height of separator
          //   width: 1.5, // Width of separator
          //   color: Colors.grey.shade300, // Light grey separator color
          // ),
          // const SizedBox(width: 10), // Space between separator and mic icon
          // Icon(Icons.mic, color: Colors.grey.shade400), // Mic icon
        ],
      ),
    );
  }
}
