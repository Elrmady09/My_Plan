import 'package:flutter/material.dart';
import 'package:my_plan/Model/CompletedTaskModel/CompletedTaskModel.dart';
import 'package:my_plan/Model/TaskModel/TaskModel.dart';
import 'package:my_plan/Pages/Bottom%20Bar%20Categories/Bottom%20Bar%20Categories.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:my_plan/test3.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(CompletedTaskModelAdapter());
  await Hive.openBox<TaskModel>('tasksBox');
  await Hive.openBox<CompletedTaskModel>('completedTasksBox');



  runApp(const My_Plan());
}



class My_Plan extends StatelessWidget {
  const My_Plan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottom_Bar_Categories(),
    );
  }
}


