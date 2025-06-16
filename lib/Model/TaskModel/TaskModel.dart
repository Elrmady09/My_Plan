import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'TaskModel.g.dart'; // ✅ مهم جدًا

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  DateTime? dueDate;

  @HiveField(3)
  String? reminder;

  @HiveField(4)
  String? priority;

  @HiveField(5)
  String? category;

  @HiveField(6)
  String? repeat;

  @HiveField(7)
  int? taskTypeIconCodePoint; // رمز الأيقونة

  @HiveField(8)
  String? taskTypeIconFontFamily; // الخط الخاص بالأيقونة

  @HiveField(9)
  String? imagePath;

  @HiveField(10)
  String? taskTypeName;


  TaskModel({
    required this.title,
    required this.description,
    this.dueDate,
     this.reminder,
     this.priority,
     this.category,
     this.repeat,
    this.taskTypeIconCodePoint,
    this.taskTypeIconFontFamily,
    this.imagePath,
    this.taskTypeName,

  });

  IconData? get taskTypeIcon {
    if (taskTypeIconCodePoint == null || taskTypeIconFontFamily == null) return null;
    return IconData(taskTypeIconCodePoint!, fontFamily: taskTypeIconFontFamily);
  }


}

















