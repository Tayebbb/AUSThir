import 'package:austhir/library.dart';
import 'package:flutter/material.dart';
import 'package:austhir/faqScreen.dart';
import 'package:austhir/cgpacalc.dart';
import 'attendance.dart';
import 'academic_calender.dart';
import 'finance.dart';
import 'materials.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              color: Colors.indigo[900],
              child: const Column(
                children: [
                  SizedBox(height: 70),
                  Center(
                    child: Text(
                      "DashBoard",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      color: Colors.blue.shade800,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/profile.jpg'),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Hi, Welcome Back',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Text('User Name',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildInfoCard('Student ID', '24101466'),
                                _buildInfoCard('Semester', 'Spring 2024'),
                              ],
                            ),
                            const SizedBox(height: 16),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: const LinearProgressIndicator(
                                value: 0.26,
                                backgroundColor: Colors.white24,
                                color: Colors.white,
                                minHeight: 10,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: const Text('Completed 36 Credits (26%)',
                                  style: TextStyle(color: Colors.blue)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: [
                          _buildGridItem(
                              context, Icons.newspaper, 'Events', () {}),
                          _buildGridItem(
                              context,
                              Icons.check_circle,
                              'Attendance',
                              () => _navigate(context, const AttendancePage())),
                          _buildGridItem(
                              context,
                              Icons.calendar_today,
                              'Calendar',
                              () => _navigate(
                                  context, const AcademicCalendarPage())),
                          _buildGridItem(
                              context,
                              Icons.calculate,
                              'CGPA Calculator',
                              () => _navigate(
                                  context, const CgpaCalculatorScreen())),
                          _buildGridItem(context, Icons.book, 'Materials',
                              () => _navigate(context, const Materials())),
                          _buildGridItem(context, Icons.help, 'FAQ',
                              () => _navigate(context, FAQScreen())),
                          _buildGridItem(context, Icons.attach_money, 'Finance',
                              () => _navigate(context, const FinancePage())),
                          _buildGridItem(
                              context,
                              Icons.library_books,
                              'Library',
                              () => _navigate(context, LibraryPage())),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.white70)),
        Text(value,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildGridItem(
      BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue.shade800,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  void _navigate(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
