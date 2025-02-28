import 'package:flutter/material.dart';

class Materials extends StatelessWidget {
  const Materials({super.key});

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
                    "Materials",
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
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    children: [
                      SquareButton(
                        text: '1.1',
                        icon: Icons.book,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageScreen(imageName: '1.1.png'),
                            ),
                          );
                        },
                      ),
                      SquareButton(
                        text: '1.2',
                        icon: Icons.book,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageScreen(imageName: '1.2.png'),
                            ),
                          );
                        },
                      ),
                      SquareButton(
                        text: '2.1',
                        icon: Icons.book,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageScreen(imageName: '2.1.png'),
                            ),
                          );
                        },
                      ),
                      SquareButton(
                        text: '2.2',
                        icon: Icons.book,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageScreen(imageName: '2.2.png'),
                            ),
                          );
                        },
                      ),
                      SquareButton(
                        text: '3.1',
                        icon: Icons.book,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageScreen(imageName: '3.1.png'),
                            ),
                          );
                        },
                      ),
                      SquareButton(
                        text: '3.2',
                        icon: Icons.book,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageScreen(imageName: '3.2.png'),
                            ),
                          );
                        },
                      ),
                      SquareButton(
                        text: '4.1',
                        icon: Icons.book,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageScreen(imageName: '4.1.png'),
                            ),
                          );
                        },
                      ),
                      SquareButton(
                        text: '4.2',
                        icon: Icons.book,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageScreen(imageName: '4.2.png'),
                            ),
                          );
                        },
                      ),
                    ],
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo[900],
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

class ImageScreen extends StatelessWidget {
  final String imageName;

  const ImageScreen({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text(imageName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Image.asset('assets/$imageName'), // Assuming the image is in the assets/
      ),
    );
  }
}
