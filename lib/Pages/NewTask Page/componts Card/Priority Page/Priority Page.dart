import 'package:flutter/material.dart';
import 'package:my_plan/Colors/Colors.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Genral%20Widget/Header/Header.dart';


class Priority_page extends StatefulWidget {
  const Priority_page({Key? key}) : super(key: key);

  @override
  State<Priority_page> createState() => _Priority_pageState();
}

class _Priority_pageState extends State<Priority_page> {
  String _selectedRepeat = 'none';
  final List<String> _options = [
    'none',
    'High',
    'Medium',
    'Weak',
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header_Task(
              titel: 'Priority',
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
