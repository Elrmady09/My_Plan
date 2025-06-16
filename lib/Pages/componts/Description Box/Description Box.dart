import 'package:flutter/material.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Genral%20Widget/Genral%20TextField/Genral%20TextField.dart';
import 'package:my_plan/Genral%20Widget/space/space.dart';


class Description_Box extends StatelessWidget {
  const Description_Box({Key? key, this.textEditingController, this.focusNode, this.onSubmitted, this.colortextfield}) : super(key: key);
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final Color? colortextfield;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          padding: EdgeInsets.only(top: size.height * 0.025,left: size.width * 0.06),
          text: 'Description',
          sizetext: 20,
          fontWeight: FontWeight.w700,
        ),
        HeightSpace(space: 0.015),
        Center(
          child: Genral_TextField(
            textEditingController: textEditingController ,
            focusNode:focusNode ,
            onSubmitted:onSubmitted ,
            title: '',
            maxlines: 4,
            height_textfield: size.height * 0.2,
            colortextfield: colortextfield,

          ),
        ),



      ],
    );
  }
}
