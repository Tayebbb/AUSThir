import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final List<Map<String, dynamic>> subjects = [
    {"name": "CSE-2103", "percentage": 100},
    {"name": "CSE-2105", "percentage": 85},
    {"name": "EEE-2141", "percentage": 92},
    {"name": "MATH-2101", "percentage": 67},
    {"name": "HUM-2105", "percentage": 96},
  ];

  void addSubject(String subjectName, int totalClasses, int attendedClasses) {
    setState(() {
      int percentage = (attendedClasses / totalClasses * 100).toInt();
      subjects.add({"name": subjectName, "percentage": percentage});
    });
  }

  void showAddSubjectDialog() {
    final TextEditingController subjectController = TextEditingController();
    final TextEditingController totalClassesController =
        TextEditingController();
    final TextEditingController attendedClassesController =
        TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Subject"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: subjectController,
                decoration: const InputDecoration(labelText: "Subject Name"),
              ),
              TextField(
                controller: totalClassesController,
                decoration: const InputDecoration(labelText: "Total Classes"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: attendedClassesController,
                decoration:
                    const InputDecoration(labelText: "Classes Attended"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                final String subjectName = subjectController.text;
                final int totalClasses =
                    int.tryParse(totalClassesController.text) ?? 0;
                final int attendedClasses =
                    int.tryParse(attendedClassesController.text) ?? 0;
                if (subjectName.isNotEmpty &&
                    totalClasses > 0 &&
                    attendedClasses <= totalClasses) {
                  addSubject(subjectName, totalClasses, attendedClasses);
                  Navigator.pop(context);
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Attendance",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.10,
            left: 20,
            right: 0,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Attendance Record",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Text(
                  "Keep track of your attendance here!",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: subjects.length,
                      itemBuilder: (context, index) {
                        final subject = subjects[index];
                        return _buildAttendanceTile(
                          subject["name"],
                          subject["percentage"],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: showAddSubjectDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.black, width: 2),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text(
                        "Add Subject",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceTile(String subject, int percentage) {
    return Card(
      color: Colors.grey[100],
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          subject,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Attendance: $percentage%',
          style: const TextStyle(color: Colors.black54),
        ),
        trailing: Icon(
          percentage >= 75 ? Icons.check_circle : Icons.cancel,
          color: percentage >= 75 ? Colors.greenAccent[400] : Colors.red,
        ),
      ),
    );
  }
}
