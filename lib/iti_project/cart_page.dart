import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState(); 
}
List<Map<String, dynamic>> cartItems = [
    
  ];
  
class _CartPageState extends State<CartPage> {
  @override
  void initState(){
    super.initState();
    setState(() {
      
    });
  }

  double get totalPrice {
    return cartItems.fold(
        0, (sum, item) => sum + (item["price"] * item["quantity"]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
        "My Cart",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.black),
    ),
    body: cartItems.isEmpty
    ? const Center(
    child: Text(
    "Your cart is empty!",
    style: TextStyle(fontSize: 20),
    ),
    )
        : Column(
    children: [
    Expanded(
    child: ListView.builder(
    padding: const EdgeInsets.all(12),
    itemCount: cartItems.length,
    itemBuilder: (context, index) {
    final item = cartItems[index];
    return Card(
    margin: const EdgeInsets.symmetric(vertical: 8),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    side: const BorderSide(
    color: Colors.pink,
    width: 1.5,
    ),
    ),
    child: ListTile(
    leading: ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Image.asset(
    item["image"],
    width: 60,
    height: 60,
    fit: BoxFit.cover,
    ),
    ),
    title: Text(
    item["name"],
    style: const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.pink,
    ),
    ),
    subtitle: Text(
    "\$${item["price"]}",
    style: const TextStyle(
    color: Colors.black54,
    ),
    ),
    trailing: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
    IconButton(
    icon: const Icon(Icons.remove_circle_outline),
    onPressed: () {
    setState(() {
    if (item["quantity"] > 1) {
    item["quantity"]--;
    } else {
    cartItems.removeAt(index);
    }
    });},
    ),
      Text("${item["quantity"]}",
          style: const TextStyle(fontSize: 16)),
      IconButton(
        icon: const Icon(Icons.add_circle_outline),
        onPressed: () {
          setState(() {
            item["quantity"]++;
          });
        },
      ),
    ],
    ),
    ),
    );
    },
    ),
    ),
      Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, -2),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total:",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Text("\$${totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink)),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      )
    ],
    ),
    );
  }
}