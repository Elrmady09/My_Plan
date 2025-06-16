import 'package:flutter/material.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';

class SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const SettingTile({
    required this.icon,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(size.width * 0.02),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue.shade100),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.blue),
      ),
      title: GeneralText(
        padding: EdgeInsets.all(0),
        text: title,
        fontWeight: FontWeight.w600,
      ),
      subtitle: subtitle != null
          ? GeneralText(
        padding: EdgeInsets.all(0),
        text : subtitle!,
        color: Colors.grey,
      )
          : null,
      contentPadding: EdgeInsets.zero,
      onTap: () {},
    );
  }
}