import 'package:flutter/material.dart';

final BoxDecoration decoration_Task = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.19), // 🔹 لون الظل
        blurRadius: 20, // 🔹 مدى نعومة الظل
        spreadRadius: 15, // 🔹 مدى انتشار الظل
        offset: Offset(0, 4), // 🔹 موقع الظل
      ),
    ]
);

