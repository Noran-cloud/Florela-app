import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iti2/iti_project/Product_details.dart';
import 'package:iti2/iti_project/api_provider.dart';
//import 'package:iti2/iti_project/fav_items.dart';
import 'package:iti2/iti_project/products.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

late final PageController _controller;
int _currentPage = 0;

  bool isFavorite = false;

  final List<String> images = [
    'assets/images/pic21.jpeg',
    'assets/images/pic19.jpg',
    'assets/images/pic18.jpg',
  ];
Products? products;

getData() async {
  try {
    final fetchedProducts = await ApiProvider().getHttp();
    print("Fetched products: $fetchedProducts");
    setState(() {
      products = fetchedProducts;
    });
  } catch (e) {
    print("Error fetching data: $e");
  }
}


@override
void initState() {
  super.initState();
  final initialPage = (images.length / 2).floor(); 
  _controller = PageController(
    viewportFraction: 0.7,
    initialPage: initialPage,
  );
  _currentPage = initialPage;

  getData();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: const Color.fromARGB(255, 70, 69, 69))
                ),
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                            border: InputBorder.none,
                            isCollapsed: true
                          ),
                          
                        ),
                      ),
                      Icon(EvaIcons.search,color: Colors.grey,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Stack(
                children:[ 
                  Container(
                  height: 170,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/pic16.jpeg',fit: BoxFit.cover,),
                  ),
                ),
                Positioned( bottom: 0,left: 0,right: 0,top: 0,
                  child: Column( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Text('Your Story. Petal by petal.',style: TextStyle(color: Colors.white,fontSize: 16),),
                  Text('CREATE YOUR BOUQUET',style: TextStyle(color: Colors.white,letterSpacing: 4,fontSize: 20),),
                  ElevatedButton(onPressed: (){}, 
                  style: ElevatedButton.styleFrom(side: BorderSide(color: Colors.white),backgroundColor: Colors.transparent,maximumSize: Size(160, 70)),
                  child: Text('Get Started',style: TextStyle(color: Colors.white),))
                    ],
                  ),
                ),
                ],
              ),
              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Discover Today\'s Favorites',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                  TextButton(onPressed: (){}, child: Text('see all',style: TextStyle(color: Colors.black,fontSize: 15),),),              
                ],
              ),
              SizedBox(height: 20,),
               SizedBox(
              height: 270,              
              child: PageView.builder(
                controller: _controller,
                itemCount: images.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final isCurrent = index == _currentPage;
                  final scale = isCurrent ? 1.0 : 0.85;
        
                  return TweenAnimationBuilder(
                    tween: Tween(begin: scale, end: scale),
                    duration: const Duration(milliseconds: 330),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: child,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage( 
                          image: AssetImage(images[index], ),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: isCurrent
                            ? [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 6),
                                  blurRadius: 12,
                                )
                              ]
                            : [],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.purple : Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            SizedBox(height: 12,),
            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Best Sellers',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                  TextButton(onPressed: (){}, child: Text('see all',style: TextStyle(color: Colors.black,fontSize: 15),),),              
                ],
            ),


            SizedBox(
  height: 250,
  child: products == null
      ? const Center(child: CircularProgressIndicator()) // Loader
      : products!.bestSellers.isEmpty
          ? const Center(child: Text("No Best Sellers found"))
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products!.bestSellers.length,
              itemBuilder: (context, index) {
                final item = products!.bestSellers[index];
                return GestureDetector(
                  onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(img: '${item.image}', title: '${item.title}', price: '${item.price}',)));
                    },
                  child: Container(
                    width: 180,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 247, 243, 243),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.asset(
                                  item.image,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item.title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(item.price),
                          ],
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              item.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color:
                                  item.isFavorite ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
),

          SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('For You',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
              TextButton(onPressed: (){}, child: Text('see all',style: TextStyle(color: Colors.black,fontSize: 15),),),              
            ],
          ),
          SizedBox(
  height: 250,
  child: products == null
      ? const Center(child: CircularProgressIndicator()) // Loader
      : products!.bestSellers.isEmpty
          ? const Center(child: Text("No For You found"))
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products!.bestSellers.length,
              itemBuilder: (context, index) {
                final item = products!.bestSellers[index];
                return GestureDetector(
                  onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(img: '${item.image}', title: '${item.title}', price: '${item.price}',)));
                    },
                  child: Container(
                    width: 180,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 247, 243, 243),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.asset(
                                  item.image,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item.title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(item.price),
                          ],
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              item.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color:
                                  item.isFavorite ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
),

            ],
          ),
        ),
      ),
    );
  }
}