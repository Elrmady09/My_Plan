import 'package:flutter/material.dart';
import 'package:my_plan/Colors/Colors.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Genral%20Widget/Header/Header.dart';

class Reminder_Page extends StatefulWidget {
  const Reminder_Page({Key? key}) : super(key: key);

  @override
  State<Reminder_Page> createState() => _Reminder_PageState();
}

class _Reminder_PageState extends State<Reminder_Page> {

  String? _selectedReminder;

  final List<String> _reminderTimes = [
    'None',
    'At time of event',
    '5 minutes before',
    '10 minutes before',
    '30 minutes before',
    '1 hour before',
    '1 day before',
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header_Task(
              titel: 'Reminder',
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: _reminderTimes.length,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05,vertical: size.height * 0.02),
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                final item = _reminderTimes[index];
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
                  trailing: _selectedReminder == item
                      ? Icon(Icons.check, color: Colors.blue)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedReminder = item;
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

