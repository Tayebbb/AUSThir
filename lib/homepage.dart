import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: BackButton(color: Colors.white),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Welcome to the Home Page',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Explore the features below by clicking on the buttons.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40),


              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                  padding: const EdgeInsets.all(20),
                  children: [
                    SquareButton(
                      text: 'News',
                      icon: Icons.newspaper,
                      onPressed: () {

                      },
                    ),
                    SquareButton(
                      text: 'Attendance',
                      icon: Icons.check_circle,
                      onPressed: () {

                      },
                    ),
                    SquareButton(
                      text: 'Academic Calendar',
                      icon: Icons.calendar_today,
                      onPressed: () {

                      },
                    ),
                    SquareButton(
                      text: 'Results',
                      icon: Icons.grade,
                      onPressed: () {

                      },
                    ),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Each section above offers quick access to important information for students.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),


              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '© 2025 All rights reserved',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SquareButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon;

  SquareButton({required this.text, required this.onPressed, required this.icon});

  @override
  _SquareButtonState createState() => _SquareButtonState();
}

class _SquareButtonState extends State<SquareButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: _isPressed
              ? []
              : [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 40,
                color: Colors.black,
              ),
              SizedBox(height: 8),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}