import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/shared/types.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:my_plan/Genral%20Widget/Decoration/Decoration.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Genral%20Widget/Header/Header.dart';
import 'package:my_plan/Genral%20Widget/Slider%20Route/Slider%20Route.dart';
import 'package:my_plan/Model/TaskModel/TaskModel.dart';
import 'package:my_plan/Pages/NewTask%20Page/Componts/Card%20New%20Tasks.dart';
import 'package:my_plan/Pages/NewTask%20Page/componts%20Card/Categories%20Page/Categories%20Page.dart';
import 'package:my_plan/Pages/NewTask%20Page/componts%20Card/Priority%20Page/Priority%20Page.dart';
import 'package:my_plan/Pages/NewTask%20Page/componts%20Card/Reminder%20Page/Reminder%20Page.dart';
import 'package:my_plan/Pages/NewTask%20Page/componts%20Card/Repeat%20Page/Repeat%20Page.dart';
import 'package:my_plan/Pages/NewTask%20Page/componts%20Card/Task%20Tag/Task%20Tag.dart';
import 'package:my_plan/Pages/componts/Description%20Box/Description%20Box.dart';
import 'package:my_plan/Pages/componts/Titel%20Box/Titel%20Box.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';


class NewTask_Page extends StatefulWidget {
  const NewTask_Page({Key? key}) : super(key: key);

  @override
  State<NewTask_Page> createState() => _NewTask_PageState();
}

class _NewTask_PageState extends State<NewTask_Page> {
  final TextEditingController _addTitleController = TextEditingController();
  final TextEditingController _addDescriptionController = TextEditingController();
  final FocusNode _focusNodeAddTitle = FocusNode();
  final FocusNode _focusNodeAddDescription = FocusNode();


  @override
  void initState() {
    super.initState();
    _focusNodeAddTitle.addListener(() {
      if (!_focusNodeAddTitle.hasFocus) {
        _closeAddTitle(); // ✅ عند فقدان التركيز، يتم إخفاء التأثير الضبابي
      }
    });
    _focusNodeAddDescription.addListener(() {
      if (!_focusNodeAddDescription.hasFocus) {
        _closeAddTitle(); // ✅ عند فقدان التركيز، يتم إخفاء التأثير الضبابي
      }
    });
  }

  void _closeAddTitle() {
    FocusScope.of(context).unfocus(); // ✅ إخفاء لوحة المفاتيح عند فقدان التركيز
  }
  DateTime dueDate = DateTime.now();

  String _reminderValue = 'None';
  String _priorityValue = 'None';
  String _categoriesValue = 'None';
  String _repeatValue = 'None';
  String _taskTagValue = 'None';
  IconData _iconTagValue = Icons.arrow_forward_ios ;
  String? _imagePath;


  void pickImageFromGallery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
      allowMultiple: false,
    );

    if (result != null && result.files.single.path != null) {
      File imageFile = File(result.files.single.path!);
      setState(() {
        _imagePath = imageFile.path; // 🟡 هذا ما تحفظه في TaskModel لاحقًا
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Icon _finalicon = Icon(_iconTagValue,size: 18,color: Colors.grey,);

    return SafeArea(
        child: GestureDetector(
          onTap: _closeAddTitle,
          child: Scaffold(
            backgroundColor: Color(0xffecf2fb),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Header_Task(
                    addtask: GestureDetector(
                      onTap: () async {
                        if(_addTitleController.text.isNotEmpty && _addDescriptionController.text.isNotEmpty){
                         final box = Hive.box<TaskModel>('tasksBox');
                         await box.add(TaskModel(
                           title: _addTitleController.text,
                           description: _addDescriptionController.text,
                           dueDate: dueDate,
                           reminder: _reminderValue,
                           priority: _priorityValue,
                           category: _categoriesValue,
                           repeat: _repeatValue,
                           taskTypeName: _taskTagValue != 'None' ? _taskTagValue : null,
                           imagePath: _imagePath,
                           taskTypeIconCodePoint: _taskTagValue != 'None' ? _iconTagValue.codePoint : null,
                           taskTypeIconFontFamily: _taskTagValue != 'None' ? _iconTagValue.fontFamily : null,
                         ));
                         Navigator.pop(context);
                        }else{
                          Dialogs.materialDialog(
                            color: Colors.white,
                            context: context,
                            title: 'warning',
                            msg: 'Please enter the task title and details before proceeding..',
                            lottieBuilder: Lottie.asset(
                              'assets/Lottie/warning Animation.json',
                              fit: BoxFit.contain,
                            ),
                            customViewPosition: CustomViewPosition.BEFORE_ACTION,
                            actions: [
                              IconsButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                text: 'Okay',
                                iconData: Icons.warning_amber_rounded,
                                color: Colors.orange,
                                textStyle: TextStyle(color: Colors.white),
                                iconColor: Colors.white,
                              ),
                            ],
                          );


                        }


                      },
                      child: GeneralText(
                        padding: EdgeInsets.all(0),
                        text: 'Add',
                        sizetext: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                      ),
                    ),
                    titel: 'New Task',
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.03,vertical: size.height * 0.02),
                    width: size.width,
                    height: size.height * 0.2,
                    decoration: decoration_Task,
                    child: Titel_Box(
                      textEditingController:_addTitleController,
                      focusNode: _focusNodeAddTitle,

                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03,top: size.height * 0.00),
                    width: size.width,
                    height: size.height * 0.3,
                    decoration: decoration_Task,
                    child: Description_Box(
                      textEditingController:_addDescriptionController,
                      focusNode: _focusNodeAddDescription,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: size.width * 0.03,right: size.width * 0.03,top: size.height * 0.02),
                    width: size.width,
                    height: size.height * 0.6,
                    decoration: decoration_Task,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card_NewTask(
                          ontap: () async{
                            final date = await showDatePicker(
                              context: context,
                              initialDate: dueDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            );
                            if (date != null) {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(dueDate),
                              );
                              if (time != null) {
                                dueDate = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                                setState(() {});
                              }
                            }
                          },
                          iconData: Icons.date_range_outlined,
                          titel: 'Due',
                          titeldetials: DateFormat('yyyy-MM-dd – kk:mm').format(dueDate),
                        ),
                        Card_NewTask(
                          ontap: () async {
                            final selected = await Navigator.push(
                              context,
                              createSlideRoute(const Reminder_Page()),
                            );
                            if (selected != null && selected is String) {
                              setState(() {
                                _reminderValue = selected;
                              });
                            }
                          },
                          iconwidget: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                          paddingright: size.width * 0.03,
                          iconData: Icons.notifications_none,
                          titel: 'Reminder',
                          titeldetials: _reminderValue,
                        ),
                        Card_NewTask(
                          ontap: () async {
                            final selected = await Navigator.push(
                              context,
                              createSlideRoute(const Priority_page()),
                            );
                            if (selected != null && selected is String) {
                              setState(() {
                                _priorityValue = selected;
                              });
                            }
                          },
                          iconwidget: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                          paddingright: size.width * 0.03,
                          iconData: Icons.flag_outlined,
                          titel: 'Priority',
                          titeldetials: _priorityValue,
                        ),
                        Card_NewTask(
                          ontap: () async {
                            final selected = await Navigator.push(
                              context,
                              createSlideRoute( Categories_Page()),
                            );
                            if (selected != null && selected is String) {
                              setState(() {
                                _categoriesValue = selected;
                              });
                            }
                          },
                          iconwidget: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                          paddingright: size.width * 0.03,
                          iconData: Icons.list,
                          titel: 'Categories',
                          titeldetials: _categoriesValue,
                        ),
                        Card_NewTask(
                          ontap: () async {
                            final selected = await Navigator.push(
                              context,
                              createSlideRoute(const Repeat_Page()),
                            );
                            if (selected != null && selected is String) {
                              setState(() {
                                _repeatValue = selected;
                              });
                            }
                          },
                          iconData: Icons.date_range_outlined,
                          titel: 'Repeat',
                          titeldetials: _repeatValue,
                        ),
                        Card_NewTask(
                          ontap: () async {
                            final selected = await Navigator.push(
                              context,
                              createSlideRoute(Task_Tag()),
                            );
                            if (selected != null && selected is TaskType) {
                              setState(() {
                                _taskTagValue = selected.name;
                                _iconTagValue = selected.icon;
                              });
                            }
                          },
                          iconwidget:Icon(_iconTagValue, size: 18, color: Colors.grey),
                          paddingright: size.width * 0.03,

                          iconData: Icons.category_outlined,
                          titel: 'Task Tag',
                          titeldetials: _taskTagValue,
                        ),
                        Card_NewTask(
                          ontap: (){
                            pickImageFromGallery();


                          },
                          iconData: Icons.add_photo_alternate_outlined,
                          titel: 'Add Photo',
                          titeldetials: '',
                        ),



                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}
