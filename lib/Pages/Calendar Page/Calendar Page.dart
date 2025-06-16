import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_plan/Genral%20Widget/Decoration/Decoration.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Pages/Calendar%20Page/Calendar%20Page.dart';
import 'package:my_plan/Pages/Calendar%20Page/componts/Event%20Tile/Event%20Tile.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar_Page extends StatefulWidget {
  const Calendar_Page({Key? key}) : super(key: key);

  @override
  State<Calendar_Page> createState() => _Calendar_PageState();
}

class _Calendar_PageState extends State<Calendar_Page> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffecf2fb),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GeneralText(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.07,vertical: size.height * 0.03),
              text: 'Calendar',
              sizetext: 32,
              fontWeight: FontWeight.w700,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              height: 200,
              decoration: decoration_Task,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2100, 12, 31),
                  calendarFormat: CalendarFormat.week,
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarStyle: const CalendarStyle(


                    todayDecoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,

                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                ),
              ),
            ),
            //
            // GeneralText(
            //   padding: EdgeInsets.only(top: size.height * 0.03,left: size.width * 0.07),
            //   text: "Upcoming",
            //   sizetext: 20,
            //   fontWeight: FontWeight.w700,
            //
            // ),
            // SizedBox(height: 10),
            // EventTile(
            //   time: "9:00",
            //   title: "Zoom meeting",
            //   color: Colors.yellow[100]!,
            // ),
            // EventTile(
            //   time: "11:00",
            //   title: "Doctor's appointment",
            //   color: Colors.teal[100]!,
            // ),




          ],
        ),
      ),
    );
  }
}







