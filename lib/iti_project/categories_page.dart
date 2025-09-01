import 'package:flutter/material.dart';
import 'package:iti2/iti_project/Tulips.dart';
import 'package:iti2/iti_project/categories_list.dart';
import 'package:iti2/iti_project/peonies.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          foregroundColor: Colors.black,
        ),
        body: Padding(
        padding: const EdgeInsets.all(12.0),
    child: GridView.builder(
    itemCount: categories.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.75,
    crossAxisSpacing: 12,
    mainAxisSpacing: 12,
    ),
    itemBuilder: (context, index) {
    final category = categories[index];
    return GestureDetector(
    onTap: () {
  final title = category['title'];

  if (title == 'Tulips') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Tulips()),
    );
  } else if (title == 'Peony') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Peonies()),
    );
  }
  
},

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  category['image']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category['title']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
    },
    ),
        ),
    );
  }
}