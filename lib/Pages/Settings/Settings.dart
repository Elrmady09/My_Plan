import 'package:flutter/material.dart';
import 'package:my_plan/Genral%20Widget/Decoration/Decoration.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Genral%20Widget/Header/Header.dart';
import 'package:my_plan/Pages/Settings/componts/Section%20Title/Section%20Title.dart';
import 'package:my_plan/Pages/Settings/componts/Setting%20Tile/Setting%20Tile.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GeneralText(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02,horizontal: size.width * 0.07),
                  text: 'Settings',
                  sizetext: 26,
                  fontWeight: FontWeight.w900,
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: decoration_Task,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Reminder Settings
                      SectionTitle(title: "Reminder Settings"),
                      SettingTile(
                        icon: Icons.calendar_today_outlined,
                        title: "Daily Reminders",
                        subtitle: "Receive daily reminders",
                      ),
                      Divider(),
                      SettingTile(
                        icon: Icons.event_note_outlined,
                        title: "Weekly Reminders",
                        subtitle: "Receive weekly reminders",
                      ),
                      SizedBox(height: 20),
            
                      // Category Management
                      SectionTitle(title: "Category Management"),
                      SettingTile(
                        icon: Icons.work_outline,
                        title: "Work",
                      ),
                      Divider(),
                      SettingTile(
                        icon: Icons.person_outline,
                        title: "Personal",
                      ),
                      SizedBox(height: 20),
            
                      // Theme Settings
                      SectionTitle(title: "Theme Settings"),
                      SettingTile(
                        icon: Icons.light_mode_outlined,
                        title: "Light Theme",
                      ),
                      Divider(),
                      SettingTile(
                        icon: Icons.dark_mode_outlined,
                        title: "Dark Theme",
                      ),
                    ],
                  ),
                ),
            
              ],
            ),
          ),
        )
    );
  }
}
