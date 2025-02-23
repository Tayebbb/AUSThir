import 'package:austhir/FAQScreen.dart';
import 'package:flutter/material.dart';
import 'package:austhir/cgpacalc.dart';
import 'attendance.dart';
import 'academic_calender.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              color: Colors.indigo[900],
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 70),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Saidul Islam Shehab',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Student ID: 20230104049',
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                    Text(
                      'From Semester: Spring 2024',
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView(
                          children: [
                            const SizedBox(height: 16),
                            GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              mainAxisSpacing: 30,
                              crossAxisSpacing: 30,
                              children: [
                                SquareButton(
                                    text: 'News',
                                    icon: Icons.newspaper,
                                    onPressed: () {}),
                                SquareButton(
                                    text: 'Attendance',
                                    icon: Icons.check_circle,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AttendancePage()));
                                    }),
                                SquareButton(
                                    text: 'Academic Calendar',
                                    icon: Icons.calendar_today,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AcademicCalendarPage()));
                                    }),
                                SquareButton(
                                    text: 'CGPA Calculator',
                                    icon: Icons.calculate,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CgpaCalculatorScreen()));
                                    }),
                                SquareButton(
                                    text: 'Materials',
                                    icon: Icons.book,
                                    onPressed: () {}),
                                SquareButton(
                                    text: 'FAQ',
                                    icon: Icons.help,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              FAQScreen()));
                                    }),
                                SquareButton(
                                    text: 'Finance',
                                    icon: Icons.attach_money,
                                    onPressed: () {}),
                                SquareButton(
                                    text: 'Library',
                                    icon: Icons.library_books,
                                    onPressed: () {}),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.grey[800], // Gray color for the bottom bar
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.home, color: Colors.white),
                  Icon(Icons.school, color: Colors.white),
                  Icon(Icons.notifications, color: Colors.white),
                  Icon(Icons.person, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SquareButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const SquareButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo[900], // Gray color for the button
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
