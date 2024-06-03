import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_application/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('name') ?? username;
    });
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/logo.png', height: 40),
              const SizedBox(width: 8),
              Text(
                'Hello, $username 👋',
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Add your location button logic here
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Add your search button logic here
                },
              ),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.orange.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'GET 20% OFF',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Enjoy a 20% discount when placing your order through this app.',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Image.asset('assets/ic_banner.png', height: 60),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ritz Hotel',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Booking Details - Today 10:30pm - 10 Members',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      color: Colors.black,
                      onPressed: () {
                        // Add your navigation logic here
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('All Hotels'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.black),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Pure Veg'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.black),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Non Veg'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: [
                    restaurantCard(
                      imageUrl: 'assets/food1.png',
                      title: 'Ritz-Carlton Hotel',
                      subtitle: 'Biryani, Hyderabadi, North Indian',
                      location: 'UDUPI',
                      isVeg: false,
                    ),
                    restaurantCard(
                      imageUrl: 'assets/food2.png',
                      title: 'Hotel Sai Palace',
                      subtitle:
                          'Paneer Tikka, Dal Khichdi, Paneer Butter Masala',
                      location: 'UDUPI',
                      isVeg: true,
                    ),
                    restaurantCard(
                      imageUrl: 'assets/food1.png',
                      title: 'Spice Villa',
                      subtitle: 'Chinese, Thai, Continental',
                      location: 'MANGALORE',
                      isVeg: false,
                    ),
                    restaurantCard(
                      imageUrl: 'assets/food2.png',
                      title: 'Green Leaf',
                      subtitle: 'Salads, Soups, Healthy Food',
                      location: 'UDUPI',
                      isVeg: true,
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Add your home button logic here
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                          (route) => false,
                        );
                      },
                      icon: const Icon(
                        Icons.home,
                        color: Colors.orange,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Add your scanner button logic here
                      },
                      icon: const Icon(
                        Icons.qr_code_scanner,
                        color: Colors.orange,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Add your cart button logic here
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.orange,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Add your profile button logic here
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                          (route) => false,
                        );
                      },
                      icon: const Icon(
                        Icons.person,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget restaurantCard({
    required String imageUrl,
    required String title,
    required String subtitle,
    required String location,
    required bool isVeg,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            child: Image.asset(
              imageUrl,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(subtitle),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(location),
                      if (isVeg)
                        const Icon(Icons.eco, color: Colors.green)
                      else
                        const Icon(Icons.no_food, color: Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
