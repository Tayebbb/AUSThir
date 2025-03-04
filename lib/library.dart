import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

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
    // Initially, all books are shown.
    filteredBooks = List.from(allBooks);
  }

  // Filters the list of books based on the search query.
  void filterSearchResults(String query) {
    setState(() {
      filteredBooks = allBooks
          .where((book) =>
              book["title"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo[900],
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          elevation: 0,
          title: const Center(
            child: Text(
              'Library',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.12,
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
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search for books...',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onChanged: filterSearchResults,
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: filteredBooks.length,
                          itemBuilder: (context, index) {
                            bool isAvailable =
                                filteredBooks[index]["available"];
                            return Card(
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                title: Text(
                                  filteredBooks[index]["title"],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Icon(
                                  isAvailable
                                      ? Icons.check_circle
                                      : Icons.cancel,
                                  color:
                                      isAvailable ? Colors.green : Colors.red,
                                  size: 28,
                                ),
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
