// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'homepage.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign in function
  Future<void> signInUser(
      {required String email,
        required String password,
        required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for this email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided.';
      } else {
        message = 'An error occurred. Please try again.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  // Sign up function
  Future<void> signUpUser({
    required String email,
    required String password,
    required String name,
    required String studentId,
    required String phone,
    required String username, // Added username parameter
    required BuildContext context,
  }) async {
    try {
      print('Creating user with email: $email'); // Debug log
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      print('User created: ${userCredential.user!.uid}'); // Debug log

      // Store user data in Firestore, including the username
      await _firestore.collection('austhir').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'name': name,
        'username': username, // Added username field
        'studentId': studentId,
        'eduMail': email,
        'phone': phone,
        'createdAt': Timestamp.now(),
      });
      print('User data stored in Firestore'); // Debug log

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created successfully!')),
      );
    } catch (e) {
      print('Error during sign-up: $e'); // Debug log
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }
}
