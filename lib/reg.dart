import 'package:flutter/material.dart';

// ignore: camel_case_types
class reg extends StatefulWidget {
  const reg({super.key});

  @override
  _regState createState() => _regState();
}

class _regState extends State<reg> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.indigo), // Indigo color for icon
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Text(
                  "Let's create your account",
                  style: TextStyle(
                    color: Colors.indigo, // Indigo color for text
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                _buildTextField(Icons.person, 'First Name'),
                _buildTextField(Icons.person, 'Last Name'),
                _buildTextField(Icons.account_circle, 'Username'),
                _buildTextField(Icons.email, 'Edu-Mail'),
                _buildTextField(Icons.phone, 'Phone Number'),
                _buildTextField(Icons.lock, 'Password', isPassword: true),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      checkColor: Colors.white,  // White color for checkmark
                      fillColor: MaterialStateProperty.all(Colors.indigo), // Indigo checkbox fill color
                    ),
                    const Text(
                      'I agree to ',
                      style: TextStyle(color: Colors.black), // Black color for text
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Privacy Policy',
                        style: TextStyle(color: Colors.indigo), // Indigo color for links
                      ),
                    ),
                    const Text(
                      ' and ',
                      style: TextStyle(color: Colors.black), // Black color for text
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Terms of use',
                        style: TextStyle(color: Colors.indigo), // Indigo color for links
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo, // Indigo background for the button
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(color: Colors.white), // White text for the button
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Or Sign Up With',
                  style: TextStyle(color: Colors.black54), // Slightly dark text
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        print('google');
                      },
                      child: SizedBox(
                        width: 55,
                        height: 50,
                        child: Image.asset('assets/google.png'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        print('facebook');
                      },
                      child: SizedBox(
                        width: 35,
                        height: 35,
                        child: Image.asset('assets/facebook.png'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hintText,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: Colors.black), // Black text for text fields
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.indigo), // Indigo icon color
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.indigo), // Indigo hint text color
          filled: true,
          fillColor: Colors.indigo[50], // Light indigo fill color for the text field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
