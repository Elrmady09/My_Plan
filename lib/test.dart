import 'package:flutter/material.dart';
import 'dart:async';

class TaskProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final startTime = DateTime.now().subtract(Duration(seconds: 60));
    final endTime = DateTime.now().add(Duration(seconds: 1));

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Progress UI'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🏷️ عنوان المهمة مع أيقونة
              Row(
                children: [
                  Icon(Icons.work_outline, color: Colors.black54),
                  const SizedBox(width: 6),
                  Text("Work Task", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),

              // 📝 وصف المهمة
              Text("Complete the monthly report and send it to the team.",
                  style: TextStyle(color: Colors.grey[600])),


              const SizedBox(height: 12),

              // ⏰ وقت المهمة
              Text(
                "Time: ${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')} - ${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')}",
                style: TextStyle(color: Colors.grey[700], fontSize: 13),
              ),

              const SizedBox(height: 12),

              // 📈 مؤشر الإنجاز
              TaskProgressIndicator(startTime: startTime, endTime: endTime),

              const SizedBox(height: 16),

              // 🖼️ صورة
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/Tasks Image/image 1.png', // تأكد من وجود الصورة داخل مجلد assets
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskProgressIndicator extends StatefulWidget {
  final DateTime startTime;
  final DateTime endTime;

  const TaskProgressIndicator({
    super.key,
    required this.startTime,
    required this.endTime,
  });

  @override
  State<TaskProgressIndicator> createState() => _TaskProgressIndicatorState();
}

class _TaskProgressIndicatorState extends State<TaskProgressIndicator> {
  late double progress;
  late Timer timer;
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    _updateProgress();
    timer = Timer.periodic(Duration(minutes: 1), (_) => _updateProgress());
  }

  void _updateProgress() {
    final now = DateTime.now();
    final totalDuration = widget.endTime.difference(widget.startTime).inSeconds;
    final passedDuration = now.difference(widget.startTime).inSeconds;

    double newProgress = passedDuration / totalDuration;

    if (newProgress >= 1.0) {
      newProgress = 1.0;
      isCompleted = true;
      timer.cancel();
    }

    setState(() {
      progress = newProgress.clamp(0.0, 1.0);
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isCompleted ? Icons.check_circle : Icons.access_time,
          color: isCompleted ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(
                isCompleted ? Colors.green : Colors.green.withOpacity(progress),
              ),
            ),
          ),
        ),
      ],
    );
  }
}