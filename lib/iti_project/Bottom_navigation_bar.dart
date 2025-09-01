import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:iti2/iti_project/Wishlist_page.dart';
import 'package:iti2/iti_project/home_page.dart';
import 'package:iti2/iti_project/profile_page.dart';
import 'package:iti2/iti_project/categories_page.dart';
import 'package:iti2/iti_project/cart_page.dart';

class Bottom_Bar extends StatefulWidget {
  const Bottom_Bar({super.key});

  @override
  State<Bottom_Bar> createState() => _Bottom_BarState();
}

class _Bottom_BarState extends State<Bottom_Bar> {
  int index = 0;
  Icon fav = const Icon(Icons.favorite_border_outlined);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: index,
        children: [
          Home(),
          const Wishlist(),
          const CategoriesScreen(),
          CartPage(),
          const Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
            index == 1
                ? fav = const Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 218, 22, 22),
                )
                : fav = const Icon(Icons.favorite_border_outlined);
          });
        },
        currentIndex: index,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(EvaIcons.homeOutline),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: fav, label: 'Wishlist'),
          const BottomNavigationBarItem(
            icon: Icon(EvaIcons.gridOutline),
            label: 'Categories',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(EvaIcons.personOutline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
