 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iti2/iti_project/Bottom_navigation_bar.dart';
import 'package:iti2/iti_project/Login-page.dart';
import 'package:iti2/iti_project/SignUp-page.dart';
import 'package:iti2/iti_project/onboarding-page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FLORELAApp());
}

class FLORELAApp extends StatelessWidget {
  const FLORELAApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FLORELA",
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) =>  RegisterScreen(),
        '/home': (context) =>  Bottom_Bar(), 
      },
    );
  }
}