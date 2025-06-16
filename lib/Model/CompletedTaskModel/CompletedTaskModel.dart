import 'package:hive/hive.dart';

part 'CompletedTaskModel.g.dart'; // هذا السطر ضروري لإنشاء الملف

@HiveType(typeId: 1)
class CompletedTaskModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final DateTime completedAt;

  CompletedTaskModel({
    required this.title,
    required this.completedAt,
  });
}