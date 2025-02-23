import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCaQyih0dUqU276oj6amrVpIpxzNnKm_vQ',
      appId: '1:57325847678:android:b048a06c0fb8500a4b042f',
      messagingSenderId: '57325847678',
      projectId: 'austmaster-c4b72',
      databaseURL: 'https://austmaster-c4b72-default-rtdb.firebaseio.com/',
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AUSThir',
      home: SplashScreen(),
    );
  }
}
