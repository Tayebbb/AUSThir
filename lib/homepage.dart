import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:austhir/eventpage.dart';
import 'package:austhir/faqScreen.dart';
import 'package:austhir/cgpacalc.dart';
import 'package:austhir/library.dart';
import 'attendance.dart';
import 'academic_calender.dart';
import 'finance.dart';
import 'materials.dart';
import 'profilePage.dart';
import 'results.dart';
import 'todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';
  String studentId = '';
  bool isLoading = true;
  DateTime? lastPressed;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('austhir')
            .doc(currentUser.uid)
            .get();

        if (userDoc.exists) {
          setState(() {
            name = userDoc['name'] ?? 'No Name Available';
            studentId = userDoc['studentId'] ?? 'No ID Available';
            isLoading = false;
          });
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load user data: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (lastPressed == null ||
            now.difference(lastPressed!) > const Duration(seconds: 2)) {
          lastPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Press back again to exit"),
              duration: Duration(seconds: 2),
            ),
          );
          return false;
        }
        exit(0);
      },
      child: Scaffold(
        backgroundColor: Colors.white, // Background changed to white
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: _buildGridMenu(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.blue.shade100, // Light theme for card
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi, Welcome Back',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        isLoading ? 'Loading...' : name,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoCard(
                      'Student ID', isLoading ? 'Loading...' : studentId),
                  _buildInfoCard('Semester', 'Spring 2024'),
                ],
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: const LinearProgressIndicator(
                  value: 0.26,
                  backgroundColor: Colors.grey,
                  color: Colors.blue,
                  minHeight: 10,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(8),
                child: const Text('Completed 36 Credits (26%)',
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridMenu() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildGridItem(context, Icons.newspaper, 'Events',
              () => _navigate(context, const EventsPage())),
          _buildGridItem(context, Icons.library_books, 'Library',
              () => _navigate(context, const LibraryPage())),
          _buildGridItem(context, Icons.check_circle, 'Attendance',
              () => _navigate(context, const AttendancePage())),
          _buildGridItem(context, Icons.calendar_today, 'Calendar',
              () => _navigate(context, const AcademicCalendarPage())),
          _buildGridItem(context, Icons.calculate, 'CGPA Calculator',
              () => _navigate(context, const CgpaCalculatorScreen())),
          _buildGridItem(context, Icons.book, 'Materials',
              () => _navigate(context, const Materials())),
          _buildGridItem(context, Icons.help, 'FAQ',
              () => _navigate(context, const FAQScreen())),
          _buildGridItem(context, Icons.attach_money, 'Finance',
              () => _navigate(context, const FinancePage())),
          _buildGridItem(context, Icons.assessment, 'Results',
              () => _navigate(context, const ResultsPage())),
          _buildGridItem(context, Icons.check_box, 'To-Do List',
              () => _navigate(context, const ToDoListPage())),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.black54)),
        Text(value,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
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
            backgroundColor: Colors.blue.shade100,
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(label,
              style: const TextStyle(fontSize: 12, color: Colors.black)),
        ],
      ),
    );
  }

  void _navigate(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
