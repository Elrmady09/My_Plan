import 'package:flutter/material.dart';
import 'package:my_plan/Genral%20Widget/Genral%20Text/General%20Text.dart';
import 'package:my_plan/Genral%20Widget/Header/Header.dart';


class TaskType {
  final String name;
  final IconData icon;
  final Color color;

  TaskType({required this.name, required this.icon, required this.color});
}




class Task_Tag extends StatelessWidget {
   Task_Tag({Key? key}) : super(key: key);

  final List<TaskType> taskTypes = [
    TaskType(name: 'Zoom ', icon: Icons.video_call, color: Colors.blue),
    TaskType(name: 'Map ', icon: Icons.location_on, color: Colors.green),
    TaskType(name: 'Messages ', icon: Icons.chat, color: Colors.purple),
    TaskType(name: 'Call', icon: Icons.call, color: Colors.orange),
    TaskType(name: 'Email', icon: Icons.email, color: Colors.teal),
    TaskType(name: 'Notes', icon: Icons.notes, color: Colors.brown),
    TaskType(name: 'Shopping', icon: Icons.shopping_cart, color: Colors.pink),
    TaskType(name: 'Calendar', icon: Icons.calendar_today, color: Colors.indigo),
    TaskType(name: 'Maintenance', icon: Icons.build, color: Colors.amber),
    TaskType(name: 'Workout', icon: Icons.fitness_center, color: Colors.cyan),
    TaskType(name: 'Meditation', icon: Icons.self_improvement, color: Colors.deepPurple),
    TaskType(name: 'Study', icon: Icons.school, color: Colors.redAccent),
    TaskType(name: 'Invoice', icon: Icons.receipt_long, color: Colors.lightGreen),
    TaskType(name: 'Drive ', icon: Icons.directions_car, color: Colors.deepOrange),
    TaskType(name: 'Client Meeting', icon: Icons.business_center, color: Colors.blueGrey),
    TaskType(name: 'Project', icon: Icons.computer, color: Colors.lime),
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Header_Task(
                  titel: 'Task Tag',
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(16),
                  itemCount: taskTypes.length,
                  separatorBuilder: (_, __) => Divider(),
                  itemBuilder: (context, index) {
                    final taskType = taskTypes[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: taskType.color,
                        radius: 6,
                      ),
                      title: GeneralText(
                        text: taskType.name,
                        sizetext: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      trailing: Icon(taskType.icon, color: taskType.color),
                      onTap: (){
                       Navigator.pop(context, taskType);
                      },
                    );
                  },
                ),

              ],
            ),
          ),
        )
    );
  }
}
