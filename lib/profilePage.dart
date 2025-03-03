import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await _firestore.collection('austhir').doc(user.uid).get();
      if (userData.exists) {
        setState(() {
          nameController.text = userData['name'] ?? '';
          studentIdController.text = userData['studentId'] ?? '';
          usernameController.text = userData['username'] ?? '';
          emailController.text = userData['eduMail'] ?? '';
          phoneController.text = userData['phone'] ?? '';
          birthDateController.text = userData['birthDate'] ?? '';
          selectedGender = userData['gender'] ?? null;
        });
      }
    }
  }

  Future<void> updateProfile() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('austhir').doc(user.uid).update({
          'name': nameController.text,
          'studentId': studentIdController.text,
          'username': usernameController.text,
          'eduMail': emailController.text,
          'phone': phoneController.text,
          'birthDate': birthDateController.text,
          'gender': selectedGender,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile Updated Successfully!')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating profile: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  InkWell(
                    onTap: () {
                      print("Change profile picture");
                    },
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.edit, color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildTextField("Name", nameController),
              _buildTextField("Student Id", studentIdController),
              _buildTextField("Username", usernameController),
              _buildTextField("Email", emailController),
              _buildTextField("Phone Number", phoneController),
              _buildTextField("Birth Date", birthDateController),
              _buildDropdownField("Gender", ['Male', 'Female', 'Other'], (value) {
                setState(() {
                  selectedGender = value;
                });
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: updateProfile,
                child: const Text("Update Profile", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        controller: controller,
      ),
    );
  }

  Widget _buildDropdownField(String label, List<String> options, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        value: selectedGender,
        items: options.map((String value) {
          return DropdownMenuItem(value: value, child: Text(value));
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
