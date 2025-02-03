import 'package:flutter/material.dart';

class reg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
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
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Text(
                  "Let's create your account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24),
                _buildTextField(Icons.person, 'First Name'),
                _buildTextField(Icons.person, 'Last Name'),
                _buildTextField(Icons.account_circle, 'Username'),
                _buildTextField(Icons.email, 'Edu-Mail'),
                _buildTextField(Icons.phone, 'Phone Number'),
                _buildTextField(Icons.lock, 'Password', isPassword: true),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text(
                      'I agree to ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Text(
                      ' and ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Terms of use',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Create Account',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Or Sign Up With',
                  style: TextStyle(color: Colors.white54),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        print('google');
                      },
                      child: Container(
                        width: 55,
                        height: 50,
                        child: Image.asset('assets/google.png'),
                      ),
                    ),
                    SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        print('google');
                      },
                      child: Container(
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

  Widget _buildTextField(IconData icon, String hintText, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: isPassword,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white54),
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}