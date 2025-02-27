import 'package:flutter/material.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Column(
        children: [
          // Payments Title in Dark Blue (Like CGPA CALCULATOR Style)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              color: Color(0xFF0A1F44), // Dark Blue
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: const Center(
              child: Text(
                "PAYMENTS",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Payment List
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              padding: const EdgeInsets.all(24.0),
              child: ListView(
                children: [
                  sectionTitle("Spring, 2024 Payments"),
                  financeTile("12-01-2025", "15-01-2025", "UG Semester Fee", "77,175.00", "Cash", "Q1xsNpZRZ0Z9k66", true),
                  totalAmount("77,175.00"),

                  sectionTitle("Fall, 2023 Payments"),
                  financeTile("28-04-2024", "05-05-2024", "UG Semester Fee", "102,300.00", "Cash", "Q1xsNpY8lYsxo38", true),
                  totalAmount("102,300.00"),

                  sectionTitle("Spring, 2023 Payments"),
                  financeTile("09-12-2023", "-", "Dues", "1,000.00", "Cash", "S1zuPp-YxPlO2J-31", false),
                  financeTile("28-08-2023", "28-08-2023", "UG New Admission", "131,000.00", "Cash", "BYloI-Yosjr6-12", true),
                  totalAmount("131,000.00"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget financeTile(String appDate, String paymentDate, String feeGroup, String amount, String paymentMethod, String transactionId, bool isCompleted) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(feeGroup, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("App. Date: $appDate"),
            Text("Payment Date: ${paymentDate == "-" ? "Pending" : paymentDate}"),
            Text("Amount: $amount"),
            Text("Payment Method: $paymentMethod"),
            Text("Transaction ID: $transactionId"),
            Text(
              isCompleted ? "✔ Completed" : "❌ Uncompleted",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isCompleted ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
        trailing: Icon(
          isCompleted ? Icons.check_circle : Icons.cancel,
          color: isCompleted ? Colors.green : Colors.red,
        ),
      ),
    );
  }

  Widget totalAmount(String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "Total Verified Payments: $amount",
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
      ),
    );
  }
}
