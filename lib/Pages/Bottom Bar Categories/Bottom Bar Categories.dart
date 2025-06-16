import 'package:flutter/material.dart';
import 'package:my_plan/Colors/Colors.dart';
import 'package:my_plan/Pages/Calendar%20Page/Calendar%20Page.dart';
import 'package:my_plan/Pages/Settings/Settings.dart';
import 'package:my_plan/Pages/Stete%20Page/Stete%20Page.dart';
import 'package:my_plan/Pages/Tasks%20Page/Tasks%20Page.dart';





class Bottom_Bar_Categories extends StatefulWidget {
  const Bottom_Bar_Categories({Key? key}) : super(key: key);

  @override
  State<Bottom_Bar_Categories> createState() => _Bottom_Bar_CategoriesState();
}

class _Bottom_Bar_CategoriesState extends State<Bottom_Bar_Categories> {
  int _selectedIndex = 0;

  // قائمة الصفحات
  final List<Widget> _pages = [
    Tasks_Page(),
    Calendar_Page(),
    Stats_Page(),
    Settings(),
  ];

  // قائمة الأيقونات للـ BottomNavigationBar
  final List<IconData> _icons = [
    Icons.list_alt,
    Icons.calendar_today,
    Icons.pie_chart_outline,
    Icons.settings,
  ];



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body:_pages[_selectedIndex] ,
        bottomNavigationBar:BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: List.generate(_icons.length, (index) {
            return BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(
                    _icons[index],
                    color: _selectedIndex == index ? PrimaryColor : Colors.black,
                  ),
                ],
              ),
              label: '',
            );
          }),
        ),
      ),
    );
  }
}
