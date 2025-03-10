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
      "question": "How can I get my student ID?",
      "answer":
          "After enrollment, visit the administration office to collect your student ID."
    },
    {
      "question": "What are the library hours?",
      "answer":
          "The library is open from 8:00 AM to 6:00 PM on weekdays and 10:00 AM to 6:00 PM on weekends."
    },
    {
      "question": "How do I reset my university portal password?",
      "answer":
          "Click on 'Forgot Password' on the login page and follow the instructions."
    },
    {
      "question": "Can I transfer credits from another university?",
      "answer":
          "Yes, credit transfers are possible based on the university's policies. Contact the academic office for details."
    },
    {
      "question": "Is there a hostel facility?",
      "answer":
          "Yes, we provide hostel accommodation for both male and female students."
    },
    {
      "question": "How can I contact my professors?",
      "answer":
          "You can email them or visit their office during consultation hours."
    },
    {
      "question": "What sports facilities are available?",
      "answer":
          "We have a gym, swimming pool, and multiple sports grounds for students."
    },
    {
      "question": "How can I apply for an internship?",
      "answer":
          "Our university has a career placement office that helps students find internships."
    },
    {
      "question": "What is the grading system?",
      "answer":
          "We follow a GPA-based grading system. You can find details in the student handbook."
    },
    {
      "question": "How do I register for classes?",
      "answer":
          "You can register online through the student portal during the registration period."
    },
    {
      "question": "Are there any student clubs?",
      "answer":
          "Yes, we have several student-run clubs for different interests, including tech, arts, and sports."
    },
    {
      "question": "What transportation options are available?",
      "answer":
          "We offer university bus services and have bike racks for students."
    },
    {
      "question": "How can I submit an assignment?",
      "answer":
          "Assignments can be submitted through the LMS portal or directly to professors as instructed."
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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("FAQ"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "We're here to help you with anything and everything",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "At our university, we ensure that your concerns are heard. Check our FAQs below.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search Help",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: filteredFaqs.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredFaqs.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ExpansionTile(
                            title: Text(filteredFaqs[index]["question"]!),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(filteredFaqs[index]["answer"]!),
                              )
                            ],
                          ),
                        );
                      },
                    )
                  : const Center(child: Text("No results found")),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
