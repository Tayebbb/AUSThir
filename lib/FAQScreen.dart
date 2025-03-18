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
    {
      "question": "How to access the library?",
      "answer":
          "Students can access the library using their student ID card during working hours."
    },
    {
      "question": "How can I reset my student portal password?",
      "answer":
          "Use the 'Forgot Password' option on the login page to reset your password."
    },
    {
      "question": "What extracurricular activities are available?",
      "answer":
          "We have multiple clubs, sports teams, and cultural activities for students."
    },
    {
      "question":
          "I'm a first year first semester student. I did not yet receive my IUMS Account Information.",
      "answer":
          "Please contact the university IT department to get your account details."
    },
    {
      "question":
          "I want to apply for semester extension to continue my study.",
      "answer":
          "You need to submit a request through the academic office before the deadline."
    },
    {
      "question":
          "I failed to pay the semester fees installments in due date. What should I do now?",
      "answer":
          "You should contact the accounts section immediately for possible late payment arrangements."
    },
    {
      "question":
          "How can I get my Institutional email address? I cannot login into my Institutional email account, what should I do?",
      "answer":
          "You can get your email details from the IT department. If you face login issues, reset your password or contact IT support."
    },
    {
      "question":
          "My Section information is wrong in IUMS. As a result, I'm getting the wrong routine information.",
      "answer":
          "Visit the academic office to update your section information in the system."
    },
    {
      "question":
          "I have paid my fees through ONE Bank Branch. But still my payment is showing Pending in my IUMS account.",
      "answer":
          "It may take some time for the payment to be updated. Contact the accounts department with proof of payment if the issue persists."
    },
    {
      "question":
          "There is a problem in my Semester Grades/GPA/CGPA calculation. What should I do?",
      "answer":
          "Reach out to the examination office for verification and correction if necessary."
    },
    {
      "question":
          "I have failed to pay my semester fees in due time. Deadline of semester fees/readmission fees has already ended. How can I pay my fees?",
      "answer":
          "You need to visit the accounts section and apply for special permission to make a late payment."
    }
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
