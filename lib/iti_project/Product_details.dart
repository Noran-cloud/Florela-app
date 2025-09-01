import 'package:flutter/material.dart';
import 'package:iti2/iti_project/cart_page.dart';

class ProductDetails extends StatefulWidget {
  final String img, title, price;
  const ProductDetails({
    super.key,
    required this.img,
    required this.title,
    required this.price,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    num price = num.parse(widget.price.substring(1));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 25),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    'Product details',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    height: 350,
                    width: 300,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 247, 243, 243),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1.1,
                            child: Image.asset(
                              widget.img,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        Text(widget.price, style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: const Color.fromARGB(255, 184, 8, 8),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.purple,
                      tabs: const [Tab(text: "Details"), Tab(text: "Reviews")],
                    ),
        
                    SizedBox(
                      height: 100,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "The bouquet is composed of a soft and harmonious color palette, "
                              "primarily featuring light pink/peach carnations and white roses. "
                              "Several sprigs of eucalyptus leaves are interspersed throughout, "
                              "adding balance and fragrance.",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "⭐️⭐️⭐️⭐️⭐️ - Beautiful bouquet, fast delivery!\n\n"
                              "⭐️⭐️⭐️⭐️ - Great quality, but packaging could be better.",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        
              SizedBox(height: 40),
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 250, 155, 188),
                      minimumSize: Size(200, 60),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          content: Text(
                            'The bouquet was added to cart ✅',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                      setState(() {
                        final existingIndex = cartItems.indexWhere(
                          (item) => item["name"] == widget.title,
                        );
        
                        if (existingIndex >= 0) {
                          cartItems[existingIndex]["quantity"]++;
                        } else {
                          cartItems.add({
                            "name": widget.title,
                            "image": widget.img,
                            "price": price,
                            "quantity": 1,
                          });
                        }
                      });
                    },
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
