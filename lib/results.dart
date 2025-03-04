import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  void showResult(BuildContext context, String semester) {
    // Add your logic to display the result for the selected semester
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Showing result for $semester')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        title: const Text('Results'),
        backgroundColor: Colors.indigo[900],
      ),
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
                      "Select Semester",
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
                    const SizedBox(height: 16),
                    _buildSemesterButton(context, 'Spring 2023'),
                    const SizedBox(height: 16),
                    _buildSemesterButton(context, 'Fall 2023'),
                    const SizedBox(height: 16),
                    _buildSemesterButton(context, 'Spring 2024'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSemesterButton(BuildContext context, String semester) {
    return GestureDetector(
      onTap: () => showResult(context, semester),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade800,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            semester,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}