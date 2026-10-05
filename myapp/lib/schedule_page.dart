import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SchedulePage extends StatefulWidget {

  final String name;
  final String section;
  final String yearLevel;

  const SchedulePage({
    super.key,
    required this.name,
    required this.section,
    required this.yearLevel,
  });

  @override
  State<SchedulePage> createState() {
    return _SchedulePageState();
  }
}

class _SchedulePageState extends State<SchedulePage> {

  TextEditingController subject1 = TextEditingController();
  TextEditingController schedule1 = TextEditingController();

  TextEditingController subject2 = TextEditingController();
  TextEditingController schedule2 = TextEditingController();

  TextEditingController subject3 = TextEditingController();
  TextEditingController schedule3 = TextEditingController();

  void saveData() async {

    await FirebaseFirestore.instance.collection('students').add({

      'name': widget.name,
      'section': widget.section,
      'yearLevel': widget.yearLevel,

      'subject1': subject1.text,
      'schedule1': schedule1.text,

      'subject2': subject2.text,
      'schedule2': schedule2.text,

      'subject3': subject3.text,
      'schedule3': schedule3.text,

    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Student Registration Saved!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Subject Schedule'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(

          child: Column(
            children: [

              const Text(
                'SUBJECT SCHEDULE',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: subject1,
                decoration: const InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: schedule1,
                decoration: const InputDecoration(
                  labelText: 'Schedule',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: subject2,
                decoration: const InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: schedule2,
                decoration: const InputDecoration(
                  labelText: 'Schedule',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: subject3,
                decoration: const InputDecoration(
                  labelText: 'Subject',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: schedule3,
                decoration: const InputDecoration(
                  labelText: 'Schedule',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: saveData,
                child: const Text('SAVE TO FIRESTORE'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

