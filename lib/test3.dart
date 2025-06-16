import 'package:flutter/material.dart';

class test33 extends StatelessWidget {
  const test33({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 20,),
            taskInfoCard1(context,'df',5),
            SizedBox(height: 20,),
            taskInfoCard2(context,'ff','ff'),
            SizedBox(height: 20,),
            taskInfoCard3(context,'ff','ff'),
            SizedBox(height: 20,),
            taskInfoCard4(context,'fff',5,6),
            SizedBox(height: 20,),
            taskInfoCard5(context,3),
            SizedBox(height: 20,),
            taskInfoCard6(context,"Finish design draft and send it to the team."),
            SizedBox(height: 20,),
            taskInfoCard7(context,"In Progress"),
            SizedBox(height: 20,),
            taskInfoCard8(context,"Last updated: May 6, 2025, 2:45 PM"),
            SizedBox(height: 20,),
            taskInfoCard9(context, "1h 12m"),
          ],
        ),
      ),
    );
  }
}

Widget taskInfoCard1(BuildContext context, String status, double progress) {
  return Container(
    width: 180,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.green.shade100,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              status == 'Completed'
                  ? Icons.check_circle
                  : Icons.hourglass_bottom,
              color: Colors.green,
            ),
            SizedBox(width: 6),
            Text(status, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 10),
        Text("Progress", style: TextStyle(fontSize: 13, color: Colors.black54)),
        SizedBox(height: 4),
        LinearProgressIndicator(
          value: progress,
          minHeight: 6,
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ),
      ],
    ),
  );
}

Widget taskInfoCard2(BuildContext context, String priority, String dueTime) {
  Color getPriorityColor(String level) {
    switch (level.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  return Container(
    width: 180,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.flag, color: getPriorityColor(priority)),
            SizedBox(width: 6),
            Text("Priority: $priority"),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.access_time_filled, color: Colors.blue),
            SizedBox(width: 6),
            Text("Due: $dueTime"),
          ],
        ),
      ],
    ),
  );
}

Widget taskInfoCard3(BuildContext context, String reminderTime, String repeat) {
  return Container(
    width: 180,
    padding: EdgeInsets.all(14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: Colors.orange.shade100,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.alarm, color: Colors.deepOrange),
            SizedBox(width: 6),
            Text("Reminder: $reminderTime"),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.repeat, color: Colors.orange),
            SizedBox(width: 6),
            Text("Repeat: $repeat"),
          ],
        ),
      ],
    ),
  );
}

Widget taskInfoCard4(BuildContext context, String category, int attachments, int notes) {
  return Container(
    width: 180,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        colors: [Colors.white, Colors.blue.shade50],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.category, color: Colors.blueGrey),
            SizedBox(width: 6),
            Text("Category: $category"),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.attach_file, color: Colors.blueAccent),
            SizedBox(width: 6),
            Text("$attachments Files"),
          ],
        ),
        Row(
          children: [
            Icon(Icons.note, color: Colors.indigo),
            SizedBox(width: 6),
            Text("$notes Notes"),
          ],
        ),
      ],
    ),
  );
}

Widget taskInfoCard5(BuildContext context, int daysLeft) {
  return Container(
    width: 180,
    padding: EdgeInsets.all(14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: daysLeft <= 1 ? Colors.red.shade100 : Colors.yellow.shade100,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.hourglass_top, color: Colors.orange),
        SizedBox(height: 8),
        Text(
          daysLeft <= 0 ? "Due Today!" : "$daysLeft days left",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 4),
        Text("Don't miss the deadline!", style: TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    ),
  );
}

Widget taskInfoCard6(BuildContext context, String summary) {
  return Container(
    width: 180,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey.shade100,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.notes, color: Colors.black87),
        SizedBox(height: 8),
        Text("Summary", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        SizedBox(height: 6),
        Text(summary, maxLines: 4, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12)),
      ],
    ),
  );
}

Widget taskInfoCard7(BuildContext context, String status) {
  Color bgColor;
  switch (status.toLowerCase()) {
    case 'in progress':
      bgColor = Colors.orange.shade200;
      break;
    case 'done':
      bgColor = Colors.green.shade200;
      break;
    case 'pending':
      bgColor = Colors.grey.shade300;
      break;
    default:
      bgColor = Colors.blue.shade100;
  }

  return Container(
    width: 180,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Center(
      child: Text(
        status.toUpperCase(),
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget taskInfoCard8(BuildContext context, String lastUpdate) {
  return Container(
    width: 180,
    padding: EdgeInsets.all(14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.teal.shade50,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.update, color: Colors.teal),
        SizedBox(height: 6),
        Text("Last Updated", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(lastUpdate, style: TextStyle(fontSize: 12, color: Colors.teal.shade700)),
      ],
    ),
  );
}

Widget taskInfoCard9(BuildContext context, String timeSpent) {
  return Container(
    width: 180,
    padding: EdgeInsets.all(14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.purple.shade50,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.timelapse_rounded, color: Colors.purple),
        SizedBox(height: 8),
        Text("Time Spent", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(timeSpent, style: TextStyle(color: Colors.purple.shade700, fontSize: 13)),
      ],
    ),
  );
}
