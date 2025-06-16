import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_plan/Colors/Colors.dart';
import 'package:my_plan/Genral%20Widget/Decoration/Decoration.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Genral%20Widget/Glass%20Container/Glass%20Container.dart';
import 'package:my_plan/Genral%20Widget/space/space.dart';
import 'package:my_plan/Model/TaskModel/TaskModel.dart';
import 'package:my_plan/Pages/NewTask%20Page/NewTask%20Page.dart';
import 'package:my_plan/Pages/Task%20Details%20Page/Task%20Details%20Page.dart';
import 'package:my_plan/Pages/Tasks%20Page/Componts/Tasks%20Card.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:ui';



class Tasks_Page extends StatefulWidget {
  const Tasks_Page ({Key? key}) : super(key: key);

  @override
  State<Tasks_Page> createState() => _Tasks_PageState();
}

class _Tasks_PageState extends State<Tasks_Page> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //final taskBox = Hive.box<TaskModel>('tasksBox');
   // final tasks = taskBox.values.toList();
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffecf2fb),
          //backgroundColor: const Color(0xff362C9D),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:EdgeInsets.only(top: size.height * 0.02,left: size.width * 0.04,right: size.width * 0.04),
                child: Row(
                  children: [
                    GeneralText(
                      padding: EdgeInsets.all(0),
                      text: 'Tasks',
                      sizetext: 26,
                      fontWeight: FontWeight.w900,
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const NewTask_Page() ),


                          );
                        },
                        child: Icon(Icons.add_box_outlined,color: PrimaryColor,)
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.4,
                    height: size.height * 0.15,
                    margin: EdgeInsets.only(top: size.height * 0.02,left: size.width * 0.05),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blueGrey,Colors.white, Colors.grey.shade300,Colors.blueGrey,],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15), // 🔹 لون الظل
                          blurRadius: 50, // 🔹 مدى نعومة الظل
                          spreadRadius: 5, // 🔹 مدى انتشار الظل
                          offset: Offset(0, 4), // 🔹 موقع الظل
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.015,left: size.width * 0.04,right:size.width * 0.04 ),
                          child: Row(
                            children: [
                              GeneralText(
                                text: 'Today',
                                sizetext: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                              Spacer(),
                              Icon(Icons.today_outlined,color: Colors.black,)
                            ],
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable:
                          Hive.box<TaskModel>('tasksBox').listenable(),
                          builder: (context, Box<TaskModel> box, _) {
                            if (box.isEmpty) {
                              return Padding(
                                padding: EdgeInsets.only(left: size.width * 0.05, top: size.height * 0.001),
                                child: GeneralText(
                                  padding: EdgeInsets.all(0),
                                  text: 'no upcoming tasks.',
                                  sizetext: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black26,
                                ),
                              );
                            }
                            return GeneralText(
                              padding: EdgeInsets.only(top: size.height * 0.001,left: size.width * 0.05),
                              text: '${box.length } Tasks',
                              sizetext: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black26,
                            );
                          },
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: size.width * 0.015,vertical: size.height * 0.006),
                          child: LinearProgressIndicator(value: 0.6, minHeight: 5),
                        ),
                        ValueListenableBuilder(
                            valueListenable: Hive.box<TaskModel>('tasksBox').listenable(),
                            builder: (context, Box<TaskModel> box, _){
                              final highPriorityCount = box.values.where((task) => task.priority == 'High').length;
                              final mediumPriorityCount = box.values.where((task) => task.priority == 'Medium').length;
                              return Padding(
                                padding:  EdgeInsets.symmetric(horizontal: size.width * 0.01,),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.flag, size: 16, color: Colors.red),
                                    WidthSpace(space: 0.01),
                                    GeneralText(
                                      text: 'High: $highPriorityCount',
                                      sizetext: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                    WidthSpace(space: 0.02),
                                    Icon(Icons.timelapse, size: 16, color: Colors.orange),
                                    WidthSpace(space: 0.01),
                                    GeneralText(
                                      text: 'Med: $mediumPriorityCount',
                                      sizetext: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),

                                  ],
                                ),
                              );
                            }
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.46,
                    height: size.height * 0.15,
                    margin: EdgeInsets.only(top: size.height * 0.02,left: size.width * 0.04),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blueGrey,Colors.white, Colors.grey.shade300,Colors.blueGrey,],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15), // 🔹 لون الظل
                          blurRadius: 50, // 🔹 مدى نعومة الظل
                          spreadRadius: 5, // 🔹 مدى انتشار الظل
                          offset: Offset(0, 4), // 🔹 موقع الظل
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.015,left: size.width * 0.04,right:size.width * 0.04 ),
                          child: Row(
                            children: [
                              GeneralText(
                                text: 'Reminder',
                                sizetext: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                              Spacer(),
                              Icon(Icons.access_time_outlined,color: Colors.black,)
                            ],
                          ),
                        ),
                        ValueListenableBuilder(
                            valueListenable: Hive.box<TaskModel>('tasksBox').listenable(),
                            builder: (context, Box<TaskModel> box, _){
                              final now = DateTime.now();
                              // تصفية المهام التي وقت تذكيرها بعد الآن فقط
                              final upcomingTasks = box.values
                                  .where((task) => task.dueDate != null && task.dueDate!.isAfter(now))
                                  .toList();

                              // ترتيب المهام بحسب أقرب وقت تذكير
                              upcomingTasks.sort((a, b) => a.dueDate!.compareTo(b.dueDate!));

                              // استخراج المهمة الأقرب (إن وجدت)
                              final nextDueDate = upcomingTasks.isNotEmpty ? upcomingTasks.first.dueDate : null;

                              // تنسيق الوقت للعرض
                              final formattedTime = nextDueDate != null
                                  ? DateFormat.jm().format(nextDueDate)
                                  : 'No Tasks.';


                              return GeneralText(
                                padding: EdgeInsets.only(top: size.height * 0.01,left: size.width * 0.042,),
                                text: 'Next: $formattedTime',
                                sizetext: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.black26,
                              );
                            }
                        ),
                        // GeneralText(
                        //   padding: EdgeInsets.only(top: size.height * 0.01,left: size.width * 0.042,),
                        //   text: 'Next: 11:00 AM',
                        //   sizetext: 13,
                        //   fontWeight: FontWeight.w700,
                        //   color: Colors.black26,
                        // ),
                        GeneralText(
                          padding: EdgeInsets.only(left: size.width * 0.042,),
                          text: "You're almost there!  👊",
                          sizetext: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.greenAccent,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03,top: size.height * 0.01),
                width: size.width,
                height: size.height * 0.62,
                //decoration: decoration_Task,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      GeneralText(
                        padding: EdgeInsets.only(top: size.height * 0.025,left: size.width * 0.06),
                        text: 'Upcoming',
                        sizetext: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff29B6F6),
                      ),
                      HeightSpace(space: 0.02),


                      ValueListenableBuilder(
                        valueListenable: Hive.box<TaskModel>('tasksBox').listenable(),
                        builder: (context, Box<TaskModel> box, _) {
                          return ListView.builder(
                            itemCount: box.length,
                            shrinkWrap: true, // يجعل ListView تأخذ فقط المساحة المطلوبة
                            physics: NeverScrollableScrollPhysics(), // يمنع التمرير داخلها لأنها داخل عمود
                            itemBuilder: (context, index) {
                              final task = box.getAt(index);
                              return Tasks_Card(
                                ontap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) =>  Task_Details_Page(task: task!, taskIndex: index,) ),
                                  );
                                },
                                time: task?.dueDate ,
                                task_titel: task?.title ?? '',
                                task_details: task?.description ?? '',
                                task_state: task?.taskTypeName ?? '',
                                task_image: task?.imagePath != null
                                    ? task!.imagePath! // من المعرض
                                    : '',
                                icon_state: task?.taskTypeIconCodePoint != null && task?.taskTypeIconFontFamily != null
                                    ? IconData(task!.taskTypeIconCodePoint!, fontFamily: task.taskTypeIconFontFamily)
                                    : null,
                              );
                            },
                          );
                        },
                      ),



                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
    );
  }
}


