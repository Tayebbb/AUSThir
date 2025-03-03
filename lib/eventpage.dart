import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    "Events",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const Spacer(),
                ],
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
                child: ListView(
                  padding: const EdgeInsets.all(24.0),
                  children: const [
                    EventCard(
                      title: "AUST CSE SOCIETY Seminar",
                      imagePath: "assets/cse_seminar.jpg",
                    ),
                    EventCard(
                      title: "AUST IDC Innovation Summit",
                      imagePath: "assets/idc_summit.jpg",
                    ),
                    EventCard(
                      title: "AUST PIC Photography Contest",
                      imagePath: "assets/pic_contest.jpg",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const EventCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}