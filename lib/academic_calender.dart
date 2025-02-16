import 'package:flutter/material.dart';

class AcademicCalendarPage extends StatelessWidget {
  const AcademicCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            alignment: Alignment.centerLeft,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Academic Calendar - Spring 2024 Semester",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Text(
                  "Stay updated with the important academic dates!",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: ListView(
                children: const [
                  AcademicEvent(title: "Orientation & Reception", date: "02-12-2024"),
                  AcademicEvent(title: "Classes Start", date: "03-12-2024"),
                  AcademicEvent(title: "Midterm Exams", date: "19-01-2025 to 23-01-2025"),
                  AcademicEvent(title: "Preparatory Leave", date: "21-03-2025 to 12-04-2025"),
                  AcademicEvent(title: "Final Exams", date: "13-04-2025 to 06-05-2025"),
                  AcademicEvent(title: "Results Publication", date: "17-05-2025"),
                  AcademicEvent(title: "Fall Semester Begins", date: "01-06-2025"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AcademicEvent extends StatelessWidget {
  final String title;
  final String date;

  const AcademicEvent({
    required this.title,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(color: Colors.black54),
        ),
        trailing: const Icon(
          Icons.calendar_today,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
