import 'package:flutter/material.dart';

class AcademicCalendarPage extends StatelessWidget {
  const AcademicCalendarPage({super.key});

  void navigateToCalendar(BuildContext context, String semester) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SemesterCalendarPage(semester: semester),
      ),
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
          "Academic Calendar",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            alignment: Alignment.centerLeft,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Academic Calendar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Text(
                  "Select a semester to view its academic calendar!",
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
              child: Column(
                children: [
                  _buildSemesterButton(
                      context, "Fall 2023", "Fall 2023 Academic Calendar"),
                  const SizedBox(height: 16),
                  _buildSemesterButton(
                      context, "Spring 2024", "Spring 2024 Academic Calendar"),
                  const SizedBox(height: 16),
                  _buildSemesterButton(
                      context, "Fall 2024", "Fall 2024 Academic Calendar"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSemesterButton(
      BuildContext context, String semester, String title) {
    return GestureDetector(
      onTap: () => navigateToCalendar(context, semester),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.shade800,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class SemesterCalendarPage extends StatelessWidget {
  final String semester;

  const SemesterCalendarPage({required this.semester, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> events = getEventsForSemester();

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
        title: Text(
          semester,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [
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
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return AcademicEvent(
                      title: event["title"]!, date: event["date"]!);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, String>> getEventsForSemester() {
    if (semester == "Fall 2023") {
      return const [
        {"title": "Orientation & Reception", "date": "02-06-2023"},
        {"title": "Classes Start", "date": "03-06-2023"},
        {"title": "Midterm Exams", "date": "19-07-2023 to 23-07-2023"},
        {"title": "Preparatory Leave", "date": "21-09-2023 to 12-10-2023"},
        {"title": "Final Exams", "date": "13-10-2023 to 06-11-2023"},
        {"title": "Results Publication", "date": "17-11-2023"},
      ];
    } else if (semester == "Spring 2024") {
      return const [
        {"title": "Orientation & Reception", "date": "02-12-2024"},
        {"title": "Classes Start", "date": "03-12-2024"},
        {"title": "Midterm Exams", "date": "19-01-2025 to 23-01-2025"},
        {"title": "Preparatory Leave", "date": "21-03-2025 to 12-04-2025"},
        {"title": "Final Exams", "date": "13-04-2025 to 06-05-2025"},
        {"title": "Results Publication", "date": "17-05-2025"},
      ];
    } else if (semester == "Fall 2024") {
      return const [
        {"title": "Orientation & Reception", "date": "02-06-2024"},
        {"title": "Classes Start", "date": "03-06-2024"},
        {"title": "Midterm Exams", "date": "19-07-2024 to 23-07-2024"},
        {"title": "Preparatory Leave", "date": "21-09-2024 to 12-10-2024"},
        {"title": "Final Exams", "date": "13-10-2024 to 06-11-2024"},
        {"title": "Results Publication", "date": "17-11-2024"},
      ];
    }
    return [];
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
