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
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
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
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/profile.jpg'),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Hi, Welcome Back',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Text('Cristiano Ronaldo',
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
                              child: LinearProgressIndicator(
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
                              context, Icons.newspaper, 'News', () {}),
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
                              'CGPA',
                              () => _navigate(
                                  context, const CgpaCalculatorScreen())),
                          _buildGridItem(context, Icons.book, 'Materials',
                              () => _navigate(context, const Materials())),
                          _buildGridItem(context, Icons.help, 'FAQ',
                              () => _navigate(context, FAQScreen())),
                          _buildGridItem(context, Icons.attach_money, 'Finance',
                              () => _navigate(context, const FinancePage())),
                          _buildGridItem(
                              context, Icons.library_books, 'Library', () {}),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue.shade900,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
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
