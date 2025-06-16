import 'package:flutter/material.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Genral%20Widget/space/space.dart';
import 'package:my_plan/Pages/NewTask%20Page/NewTask%20Page.dart';

class Header_Task extends StatelessWidget {
  const Header_Task({Key? key, this.addtask, this.titel}) : super(key: key);
  final Widget? addtask;
  final String? titel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.02,horizontal: size.width * 0.04),
      child: Row(
        children: [
          GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back)
          ),
          WidthSpace(space: 0.07),
          GeneralText(
            padding: EdgeInsets.all(0),
            text: titel ?? 'Tasks',
            sizetext: 26,
            fontWeight: FontWeight.w900,
          ),
          Spacer(),
          if (addtask != null) addtask!,

        ],
      ),
    );
  }
}
