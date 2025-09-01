import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String message = '';
  bool isLoading = false;

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;

    if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
      setState(() {
        message = "❌ Passwords do not match";
      });
      return;
    }

    setState(() {
      isLoading = true;
      message = '';
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      setState(() {
        message = "✅ Account created successfully";
      });
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      setState(() {
        message = "❌ ${e.message}";
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
    "Create an Account",
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black87),
    ),
    const SizedBox(height: 30),

    // First Name
    TextFormField(
    controller: firstNameController,
    decoration: InputDecoration(
    labelText: 'First Name',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(color: Colors.grey),
    ),
    prefixIcon: const Icon(Icons.person),
    filled: true,
    fillColor: Colors.white,
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return ' Required';
    }
    return null;
    },
    ),
    const SizedBox(height: 15),

    // Last Name
    TextFormField(
    controller: lastNameController,
    decoration: InputDecoration(
    labelText: 'Last Name',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(color: Colors.grey),),
    prefixIcon: const Icon(Icons.person_outline),
    filled: true,
    fillColor: Colors.white,
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return ' Required';
    }
    return null;
    },
    ),
    const SizedBox(height: 15),

    // Email
    TextFormField(
    controller: emailController,
    decoration: InputDecoration(
    labelText: 'Email',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(color: Colors.grey),
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
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(color: Colors.grey),
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
    const SizedBox(height: 15),

    // Confirm Password
    TextFormField(
    controller: confirmPasswordController,
    obscureText: true,
    decoration: InputDecoration(
    labelText: 'Confirm Password',
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(color: Colors.grey),
    ),
    prefixIcon: const Icon(Icons.lock_outline),
    filled: true,
    fillColor: Colors.white,
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return ' Required';
    }
    return null;
    },
    ),

    const SizedBox(height: 20),

    // Sign Up button
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xffe692a1),
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(
    horizontal: 50, vertical: 12),),
      onPressed: isLoading ? null : register,
      child: isLoading
          ? const CircularProgressIndicator(
        color: Colors.white,
      )
          : const Text("Sign Up"),
    ),

      const SizedBox(height: 10),

      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        child: const Text("Already have an account? Log in"),
      ),

      const SizedBox(height: 10),
      Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: message.contains('✅')
              ? Colors.green
              : Colors.red,
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