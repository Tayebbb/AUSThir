import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> faqs = [
    {
      "question": "What is our University?",
      "answer":
          "Our university is a leading institution providing quality education."
    },
    {
      "question": "How to apply for admission?",
      "answer": "You can apply online through our admission portal."
    },
    {
      "question": "How to check application status?",
      "answer": "Log in to your student portal and check the status."
    },
    {
      "question": "What courses are available?",
      "answer":
          "We offer a variety of undergraduate and postgraduate programs across multiple disciplines."
    },
    {
      "question": "What are the tuition fees?",
      "answer":
          "Tuition fees vary by program. You can check the official website for details."
    },
    {
      "question": "Is there any scholarship program?",
      "answer":
          "Yes, we offer multiple scholarships based on merit and financial need."
    },
    // Add more FAQs as needed
  ];

  List<Map<String, String>> filteredFaqs = [];

  @override
  void initState() {
    super.initState();
    filteredFaqs = faqs; // Show all FAQs initially
    _searchController.addListener(_filterFAQs);
  }

  void _filterFAQs() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredFaqs = faqs
          .where((faq) => faq["question"]!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "FAQs",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Search for your queries below",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search Help",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
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
                padding: const EdgeInsets.all(16.0),
                child: filteredFaqs.isNotEmpty
                    ? ListView.builder(
                        itemCount: filteredFaqs.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ExpansionTile(
                              title: Text(
                                filteredFaqs[index]["question"]!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(filteredFaqs[index]["answer"]!),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text(
                          "No results found",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
