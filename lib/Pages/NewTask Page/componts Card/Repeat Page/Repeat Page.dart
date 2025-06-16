import 'package:flutter/material.dart';
import 'package:my_plan/Colors/Colors.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Genral%20Widget/Header/Header.dart';


class Repeat_Page extends StatefulWidget {
  const Repeat_Page({Key? key}) : super(key: key);

  @override
  State<Repeat_Page> createState() => _Repeat_PageState();
}

class _Repeat_PageState extends State<Repeat_Page> {

  String _selectedRepeat = 'Does not repeat';
  final List<String> _options = [
    'Does not repeat',
    'Daily',
    'Weekly',
    'Monthly',
    'Yearly'
  ];



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header_Task(
              titel:'Repeat' ,
            ),

            ListView.separated(
              shrinkWrap: true,
              itemCount: _options.length,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05,vertical: size.height * 0.02),
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                final item = _options[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 5,
                    backgroundColor: PrimaryColor,
                  ),
                  title: GeneralText(
                    text: item,
                    sizetext: 18,
                    fontWeight: FontWeight.w500,

                  ),
                  trailing: _selectedRepeat == item
                      ? Icon(Icons.check, color: Colors.blue)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedRepeat = item;
                    });
                    Navigator.pop(context, item);
                  },
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
