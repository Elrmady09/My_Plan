import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Genral%20Widget/Header/Header.dart';
import 'package:my_plan/Genral%20Widget/space/space.dart';
import 'package:my_plan/Model/CompletedTaskModel/CompletedTaskModel.dart';
import 'package:my_plan/Model/TaskModel/TaskModel.dart';
import 'package:my_plan/Pages/Stete%20Page/componts/ChartData.dart';
import 'package:my_plan/Pages/Stete%20Page/componts/Legend%20Item/Legend%20Item.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class Stats_Page extends StatefulWidget {
  const Stats_Page({Key? key}) : super(key: key);

  @override
  State<Stats_Page> createState() => _Stats_PageState();
}

class _Stats_PageState extends State<Stats_Page> {

  int completedCount = 0;
  int totalTasks = 0;
  double completedPercent = 0;

  Future<void> _calculateStats() async {
    final tasksBox = Hive.box<TaskModel>('tasksBox');
    final completedBox = Hive.box<CompletedTaskModel>('completedTasksBox');

    // حذف المهام المتممة التي مر عليها أكثر من 24 ساعة
    for (int i = completedBox.length - 1; i >= 0; i--) {
      final task = completedBox.getAt(i);
      if (task != null && DateTime.now().difference(task.completedAt).inHours >= 24) {
        await completedBox.deleteAt(i);
      }
    }

    final currentCompletedCount = completedBox.length;
    final currentTotalTasks = tasksBox.length + currentCompletedCount;
    final percent = currentTotalTasks == 0 ? 0.0 : ((currentCompletedCount / currentTotalTasks) * 100);

    setState(() {
      completedCount = currentCompletedCount;
      totalTasks = currentTotalTasks;
      completedPercent = percent;
    });
  }

  @override
  void initState() {
    super.initState();
    _calculateStats();
  }






  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GeneralText(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02,horizontal: size.width * 0.07),
              text: 'State',
              sizetext: 26,
              fontWeight: FontWeight.w900,
            ),
           HeightSpace(space: 0.04),

            // Syncfusion Pie Chart
            SizedBox(
              height: size.height * 0.45,
              child: SfCircularChart(
                annotations: <CircularChartAnnotation>[
                  CircularChartAnnotation(
                    widget: GeneralText(
                      padding: EdgeInsets.zero,
                      text: '$completedPercent%',
                      fontWeight: FontWeight.w700,
                      sizetext: 24,
                    ),
                  )
                ],
                series: <CircularSeries>[
                  DoughnutSeries<ChartData, String>(
                    dataSource: [
                      ChartData('Completed', completedPercent, Colors.blue),
                      ChartData('Not completed', 100.0 - completedPercent, Colors.blue[100]!),
                    ],
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    pointColorMapper: (ChartData data, _) => data.color,
                    radius: '90%',
                    innerRadius: '50%',
                    dataLabelSettings: const DataLabelSettings(isVisible: false),
                  )
                ],
              ),
            ),

            HeightSpace(space: 0.03),

            LegendItem(
              color: Colors.blue,
              text: "Completed",
              percentage: "${completedPercent.toStringAsFixed(0)}%",
            ),
            LegendItem(
              color: Colors.blueAccent.shade100,
              text: "Not completed",
              percentage: "${(100 - completedPercent).toStringAsFixed(0)}%",
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width *0.03,vertical: size.height * 0.03),
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey
              ),
            ),
            Center(
              child: GeneralText(
                padding: EdgeInsets.zero,
                text:  "$completedCount tasks completed",
                sizetext: 20,
                fontWeight: FontWeight.w700,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

