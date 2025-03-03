// ignore: unnecessary_import
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_pdfview/flutter_pdfview.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/services.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> allBooks = [
    {
      "title": "Advanced Engineering Mathematics (H.K. Dass)",
      "available": true
    },
    {"title": "Introduction to Algorithms", "available": true},
    {"title": "Flutter for Beginners", "available": false},
    {"title": "Data Structures in C++", "available": false},
    {"title": "Machine Learning Basics", "available": true},
    {"title": "Operating Systems Concepts", "available": false},
  ];

  List<Map<String, dynamic>> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    filteredBooks = List.from(allBooks);
  }

  void filterSearchResults(String query) {
    setState(() {
      filteredBooks = allBooks
          .where((book) =>
              book["title"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> openPDF(BuildContext context) async {
    String assetPath =
        "assets/H.K. Dass - Advanced Engineering Mathematics.pdf";
    String filePath = await _copyAssetToTemp(assetPath);

    if (filePath.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PDFViewerScreen(pdfPath: filePath)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to load PDF")),
      );
    }
  }

  Future<String> _copyAssetToTemp(String assetPath) async {
    try {
      final ByteData data = await rootBundle.load(assetPath);
      final Uint8List bytes = data.buffer.asUint8List();
      final Directory tempDir = await path_provider.getTemporaryDirectory();
      final File tempFile =
          File('${tempDir.path}/${assetPath.split('/').last}');

      await tempFile.writeAsBytes(bytes, flush: true);
      print("PDF Copied to: ${tempFile.path}");
      return tempFile.path;
    } catch (e) {
      print("Error loading PDF: $e");
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            Colors.indigo[900], // Keeping your original background theme
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          elevation: 0,
          title: Center(
            child: Text(
              'Library',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.12,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
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
                      SizedBox(height: 16),
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search for books...',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        onChanged: filterSearchResults,
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: filteredBooks.length,
                          itemBuilder: (context, index) {
                            bool isAvailable =
                                filteredBooks[index]["available"];
                            return Card(
                              elevation: 5, // Adds a subtle shadow effect
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                title: Text(
                                  filteredBooks[index]["title"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Icon(
                                  isAvailable
                                      ? Icons.check_circle
                                      : Icons.cancel,
                                  color:
                                      isAvailable ? Colors.green : Colors.red,
                                  size: 28, // Larger icons
                                ),
                                onTap:
                                    isAvailable ? () => openPDF(context) : null,
                              ),
                            );
                          },
                        ),
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

class PDFViewerScreen extends StatelessWidget {
  final String pdfPath;
  const PDFViewerScreen({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PDF Viewer")),
      body: PDFView(
        filePath: pdfPath,
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: false,
        pageFling: false,
      ),
    );
  }
}
