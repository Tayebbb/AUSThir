// ignore: file_names
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
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
  FAQScreen({super.key});

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
        title: const Text("FAQ", textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          )
        ],
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
              child: ListView(
                children: faqs.map((faq) {
                  return Card(
                    child: ExpansionTile(
                      title: Text(faq["question"]!),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(faq["answer"]!),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Still stuck? Help us a mail away",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SendMessageScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                    ),
                    child: const Text("Send a message",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SendMessageScreen extends StatelessWidget {
  const SendMessageScreen({super.key});

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
        title: const Text("Send a Message"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Can't find the answer?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "Write an email to ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "contact.iums@aust.edu",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline),
            ),
            Text(
              " from your institutional email address.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Use the below email subject template while writing to us.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Email Subject: STUDENT FAQ :: [[STUDENT ID]] :: [[Problem Title]]",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
