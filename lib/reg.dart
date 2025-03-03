import 'package:flutter/material.dart';
import 'AuthService.dart';
import 'login.dart';
import 'homepage.dart'; // Import the HomePage

class Reg extends StatefulWidget {
  const Reg({super.key});

  @override
  _RegState createState() => _RegState();
}

class _RegState extends State<Reg> {
  bool isChecked = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController studentidController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Let's create your account",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                _buildTextField(Icons.person, 'Name', nameController),
                _buildTextField(
                    Icons.account_circle, 'Student Id', studentidController),
                _buildTextField(Icons.email, 'Edu-Mail', emailController),
                _buildTextField(Icons.phone, 'Phone Number', phoneController),
                _buildTextField(Icons.lock, 'Password', passwordController,
                    isPassword: true),
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
                      checkColor: Colors.white,
                      fillColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    const Text('I agree to ',
                        style: TextStyle(color: Colors.black)),
                    GestureDetector(
                      onTap: () {},
                      child: const Text('Privacy Policy',
                          style: TextStyle(color: Colors.indigo)),
                    ),
                    const Text(' and ', style: TextStyle(color: Colors.black)),
                    GestureDetector(
                      onTap: () {},
                      child: const Text('Terms of use',
                          style: TextStyle(color: Colors.indigo)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: isChecked
                      ? () async {
                          if (nameController.text.isEmpty ||
                              studentidController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              phoneController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please fill all fields')),
                            );
                            return;
                          }

                          // Call signUpUser and wait for the result
                          await _authService.signUpUser(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            name: nameController.text.trim(),
                            studentId: studentidController.text.trim(),
                            phone: phoneController.text.trim(),
                            context: context,
                          );

                          // If successful, navigate to the HomePage
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Or Sign Up With',
                  style: TextStyle(color: Colors.black54),
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
                const SizedBox(height: 16),
                // Added "Have an account? Sign In" button
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "Have an account? ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "Sign In",
                          style: TextStyle(color: Colors.indigo),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      IconData icon, String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.indigo),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.indigo),
          filled: true,
          fillColor: Colors.indigo[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
