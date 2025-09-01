import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String message = '';
  bool isLoading = false;

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
      message = '';
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),

      );
      Navigator.pushReplacementNamed(context, '/home');
      setState(() {
        message = "✅ Logged in successfully";
      });

      // Navigate to another screen if needed
      // Navigator.pushReplacementNamed(context, '/home');

    } catch (e) {
      setState(() {
        message = "❌ ${e.toString()}";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/flowers_bg.jpg'),
    fit: BoxFit.cover,
    ),
    ),
    child: Center(
    child: SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Form(
    key: formKey,
    child: Column(
    children: [
    const Text(
    "Welcome to FLORELA",
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black),
    ),
    const SizedBox(height: 30),

    // Email
    TextFormField(
    controller: emailController,
    decoration: InputDecoration(
    labelText: 'Email',
    border: OutlineInputBorder(
      borderRadius:
        BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.grey),
    ),
    prefixIcon: const Icon(Icons.email),
    filled: true,
    fillColor: Colors.white,
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return ' Required';
    } else if (!value.contains('@')) {
    return '📧 Enter a valid email';
    }
    return null;
    },
    ),
    const SizedBox(height: 15),

    // Password
    TextFormField(
    controller: passwordController,
    obscureText: true,
    decoration: InputDecoration(
    labelText: 'Password',
      border: OutlineInputBorder(
        borderRadius:
        BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.grey),
      ),
      prefixIcon: const Icon(Icons.lock),
    filled: true,
    fillColor: Colors.white,
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return ' Required';
    } else if (value.length < 6) {
    return ' At least 6 characters';
    }
    return null;
    },
    ),
    const SizedBox(height: 20),// Login button
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffe692a1),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
              horizontal: 50, vertical: 12),
        ),
        onPressed: isLoading ? null : login,
        child: isLoading
            ? const CircularProgressIndicator(
          color: Colors.white,
        )
            :const Text("login"),
      ),

      const SizedBox(height: 10),

      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/signup');
        },
        child: const Text("Don’t have an account? Sign up"),
      ),

      const SizedBox(height: 10),
      Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: message.contains('✅') ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
    ),
    ),
    ),
    ),
        ),
    );
  }
}