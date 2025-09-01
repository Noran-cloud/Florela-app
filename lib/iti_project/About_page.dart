import 'package:flutter/material.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                
              ),),
              
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Center(
              child: Image.asset(
                "assets/images/pic20.png", 
                height: 150,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              "🌺 FLORELA App",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            const Text(
              "FLORELA is your go-to place for fresh and beautiful flowers. "
              "You can browse, select, and order flowers directly from your phone. "
              "Whether it's for a birthday, anniversary, or just to brighten your day, "
              "we deliver happiness in the form of flowers.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Icon(Icons.local_shipping, color: Colors.pinkAccent),
                SizedBox(width: 10),
                Text("Fast Delivery"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.credit_card, color: Colors.pinkAccent),
                SizedBox(width: 10),
                Text("Secure Payment"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.pinkAccent),
                SizedBox(width: 10),
                Text("Best Quality"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
