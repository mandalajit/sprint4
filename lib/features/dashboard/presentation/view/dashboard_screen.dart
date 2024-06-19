import 'package:campmart/features/dashboard/data/model/dashboard_model.dart';
import 'package:campmart/features/dashboard/presentation/view/cart_screen.dart';
import 'package:campmart/features/dashboard/presentation/view/favourite_screen.dart';
import 'package:campmart/features/dashboard/presentation/view/profile_screen.dart';

import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardContent(), // Home screen content
    const CartScreen(), // Placeholder for Cart screen
    const FavouriteScreen(), // Placeholder for Favorites screen
    const ProfileScreen(), // Profile screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Handle menu button tap
                print('Menu button tapped');
              },
            ),
            const Text(
              'CampMart',
              style: TextStyle(color: Colors.black),
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                // Handle profile button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 44, 44, 61),
        selectedItemColor: const Color.fromARGB(255, 67, 62, 62),
        unselectedItemColor: const Color.fromARGB(179, 28, 27, 27),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
        ],
      ),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFilterButton('Recently Added'),
              _buildFilterButton('All'),
              _buildFilterButton('New'),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: [
                DashboardItemCard(
                  dashboardModel: DashboardModel(
                    image: 'assets/images/laptop.png',
                    title: 'Acer Laptop',
                    price: '\$450.9',
                    onTap: () {
                      // Handle item tap
                      print('Acer Laptop tapped');
                    },
                  ),
                ),
                DashboardItemCard(
                  dashboardModel: DashboardModel(
                    image: 'assets/images/book.png',
                    title: "You're Not So Smart",
                    price: '\$37.9',
                    onTap: () {
                      // Handle item tap
                      print("You're Not So Smart tapped");
                    },
                  ),
                ),
                DashboardItemCard(
                  dashboardModel: DashboardModel(
                    image: 'assets/images/charger.png',
                    title: 'Charger',
                    price: '\$19.9',
                    onTap: () {
                      // Handle item tap
                      print('Charger tapped');
                    },
                  ),
                ),
                DashboardItemCard(
                  dashboardModel: DashboardModel(
                    image: 'assets/images/table.png',
                    title: 'Phone Case',
                    price: '\$12.9',
                    onTap: () {
                      // Handle item tap
                      print('Phone Case tapped');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ElevatedButton _buildFilterButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 44, 44, 61),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class DashboardItemCard extends StatelessWidget {
  final DashboardModel dashboardModel;

  const DashboardItemCard({super.key, required this.dashboardModel});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenWidth / 2 * 0.75;

    return GestureDetector(
      onTap: dashboardModel.onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: Image.asset(
                dashboardModel.image,
                height: imageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dashboardModel.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    dashboardModel.price,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
