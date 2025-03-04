import 'package:flutter/material.dart';

class Materials extends StatelessWidget {
  const Materials({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Materials",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.0,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.grey[200]!],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      final row = (index ~/ 2) + 1;
                      final col = (index % 2) + 1;
                      return SquareButton(
                        text: '$row.$col',
                        icon: Icons.book,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ImageScreen(imageName: '$row.$col.png'),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
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

  const SquareButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.indigo[700],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
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

class ImageScreen extends StatelessWidget {
  final String imageName;

  const ImageScreen({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(imageName, style: const TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.asset('assets/$imageName'),
        ),
      ),
    );
  }
}
