import 'package:flutter/material.dart';

class AboutDevelopersPage extends StatelessWidget {
  const AboutDevelopersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Developers Team",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SizedBox(height: 20,),
          Center(
            child: Text(
              "Meet the Developers",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.pink.shade400,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "The creative minds behind FLORELA 🌸",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.pink.shade50,
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.pink),
              title: const Text(
                "Nouran Mohamed Samy",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Flutter Developer"),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.pink.shade50,
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.pink),
              title: const Text(
                "Yasmeen Mohamed Abd El-Ghafar",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Flutter Developer"),
            ),
          ),
          const SizedBox(height: 20),

          const Divider(),

          const Text(
            "We are two passionate developers who love creating beautiful and functional apps. "
            "FLORELA was built with dedication, teamwork, and a shared love for flowers. "
            "We hope you enjoy using it as much as we enjoyed making it!",
            style: TextStyle(fontSize: 16, height: 1.5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
