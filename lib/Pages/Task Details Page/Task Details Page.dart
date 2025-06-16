import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:my_plan/Genral%20Widget/Decoration/Decoration.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Genral%20Widget/Header/Header.dart';
import 'package:my_plan/Genral%20Widget/Slider%20Route/Slider%20Route.dart';
import 'package:my_plan/Model/CompletedTaskModel/CompletedTaskModel.dart';
import 'package:my_plan/Model/TaskModel/TaskModel.dart';
import 'package:my_plan/Pages/NewTask%20Page/componts%20Card/Categories%20Page/Categories%20Page.dart';
import 'package:my_plan/Pages/NewTask%20Page/componts%20Card/Priority%20Page/Priority%20Page.dart';
import 'package:my_plan/Pages/NewTask%20Page/componts%20Card/Repeat%20Page/Repeat%20Page.dart';
import 'package:my_plan/Pages/Task%20Details%20Page/componts/Button%20Task%20Details.dart';
import 'package:my_plan/Pages/Task%20Details%20Page/componts/Image%20Task%20Details.dart';
import 'package:my_plan/Pages/Task%20Details%20Page/componts/Last%20Updated.dart';
import 'package:my_plan/Pages/Task%20Details%20Page/componts/details.dart';
import 'package:my_plan/Pages/componts/Description%20Box/Description%20Box.dart';
import 'package:my_plan/Pages/componts/Titel%20Box/Titel%20Box.dart';

class Task_Details_Page extends StatefulWidget {
  const Task_Details_Page({Key? key, required this.task, required this.taskIndex}) : super(key: key);
  final TaskModel task;
  final int taskIndex;

  @override
  State<Task_Details_Page> createState() => _Task_Details_PageState();
}

class _Task_Details_PageState extends State<Task_Details_Page> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _updatedImagePath;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.task.title;
    _descriptionController.text = widget.task.description;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }





  void cleanOldCompletedTasks() async {
    var completedBox = await Hive.openBox<CompletedTaskModel>('completedTasks');
    final now = DateTime.now();

    final keysToDelete = completedBox.keys.where((key) {
      final task = completedBox.get(key);
      return now.difference(task!.completedAt).inHours >= 24;
    }).toList();

    for (final key in keysToDelete) {
      await completedBox.delete(key);
    }
  }





  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xffecf2fb),
        body: Column(
          children: [
            Header_Task(
              titel: 'Task Details',
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.025,vertical: size.height * 0.01),
                width: size.width,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:MainAxisAlignment.center,

                        children: [
                          if (widget.task.imagePath != null && widget.task.imagePath!.isNotEmpty)
                            Image_Task_Details(
                                image: (_updatedImagePath ?? widget.task.imagePath!).startsWith('assets/')
                                    ? AssetImage(_updatedImagePath ?? widget.task.imagePath!) as ImageProvider
                                    : FileImage(File(_updatedImagePath ?? widget.task.imagePath!)),
                                ontap:() async {
                                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg', 'jpeg', 'png'],
                                  );

                                  if (result != null && result.files.single.path != null) {
                                    setState(() {
                                      _updatedImagePath = result.files.single.path!;
                                    });
                                  }


                                } ,
                            )
                          else
                            const Image_Task_Details_Add(),
                          Last_Updated(
                            dateandtime: 'May 6, 2025, 2:45 PM',
                          ),
                        ],
                      ),
                      Titel_Box(
                        colortextfield: Colors.grey[400],
                        textEditingController: _titleController,
                      ),
                      Description_Box(
                        colortextfield: Colors.grey[400],
                        textEditingController: _descriptionController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.025,bottom:size.height * 0.01,left: size.width * 0.06,right:size.width * 0.06 ),
                        child: Row(
                          children: [
                            GeneralText(
                              text: 'Due Date & Time',
                              sizetext: 18,
                              fontWeight: FontWeight.w700,
                            ),
                            Spacer(),
                            GeneralText(
                              text: DateFormat('yyyy-MM-dd – HH:mm').format(widget.task.dueDate!),
                              sizetext: 14,
                              fontWeight: FontWeight.w500,
                            ),

                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                        width: size.width,
                        height: size.height * 0.023,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      Details(
                        ontap: ()async {
                          final selected = await Navigator.push(
                            context,
                            createSlideRoute(const Priority_page()),
                          );
                          if (selected != null && selected is String) {
                            setState(() {
                              widget.task.priority = selected;
                            });
                          }
                        },
                        title: 'Priority', state: widget.task.priority!,
                      ),
                      Details(
                        ontap: () async {
                          final selected = await Navigator.push(
                            context,
                            createSlideRoute( Categories_Page()),
                          );
                          if (selected != null && selected is String) {
                            setState(() {
                              widget.task.category = selected;
                            });
                          }
                        },
                        title: 'Category', state: widget.task.category!,
                      ),
                      Details(
                        ontap: () async {
                          final selected = await Navigator.push(
                            context,
                            createSlideRoute(const Repeat_Page()),
                          );
                          if (selected != null && selected is String) {
                            setState(() {
                              widget.task.reminder = selected;
                            });
                          }
                        },
                        title: 'Reminder', state: widget.task.reminder!,
                      ),




                      Row(
                        children: [
                          Button_Task_Details(
                            ontap: () async {
                              final box = Hive.box<TaskModel>('tasksBox');

                              final updatedTask = TaskModel(
                                title: _titleController.text,
                                description: _descriptionController.text,
                                dueDate: widget.task.dueDate,
                                reminder: widget.task.reminder,
                                priority: widget.task.priority,
                                category: widget.task.category,
                                repeat: widget.task.repeat,
                                taskTypeIconCodePoint: widget.task.taskTypeIconCodePoint,
                                taskTypeIconFontFamily: widget.task.taskTypeIconFontFamily,
                                imagePath: _updatedImagePath ?? widget.task.imagePath,
                                taskTypeName: widget.task.taskTypeName,
                              );
                              await box.putAt(widget.taskIndex, updatedTask);
                              Navigator.pop(context); // الرجوع بعد التعديل

                            },
                            titel: 'Edit Task',
                            color: Colors.grey[300],
                          ),
                          Button_Task_Details(
                            ontap: () async {
                              final completedBox = Hive.box<CompletedTaskModel>('completedTasksBox');
                              final completedTask = CompletedTaskModel(
                                title: widget.task.title,
                                completedAt: DateTime.now(),
                              );
                              await completedBox.add(completedTask);
                              final tasksBox = Hive.box<TaskModel>('tasksBox');
                              await tasksBox.deleteAt(widget.taskIndex);
                              Navigator.pop(context);

                            },
                            titel: 'Complete Task',
                            color: Colors.blue,
                            colortitel: Colors.white,
                          ),

                        ],
                      ),
                      GestureDetector(
                        onTap: ()async{
                          final box = Hive.box<TaskModel>('tasksBox');
                          await box.deleteAt(widget.taskIndex);
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: size.width * 0.03,vertical: size.height * 0.01),
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03,),
                          height: size.height * 0.055,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child:Center(
                            child: GeneralText(
                              padding: EdgeInsets.all(0),
                              text: 'Delete Task',
                              sizetext: 15,
                              fontWeight: FontWeight.w700,

                            ),
                          ) ,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
