import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/notification.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/order_history.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/profile.dart';
import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  String selectedCategory = 'All';
  String searchQuery = '';

  List<Map<String, String>> services = [
    {
      'name': 'KIOSK 1',
      'hours': '9:00 A.M. - 4:00 P.M.',
      'category': 'Fast Food',
      'image': 'assets/kiosk1.png'
    },
    {
      'name': 'KIOSK 2',
      'hours': '8:00 A.M. - 5:00 P.M.',
      'category': 'Fast Food',
      'image': 'assets/kiosk2.png'
    },
    {
      'name': 'KIOSK 3',
      'hours': '9:00 A.M. - 4:00 P.M.',
      'category': 'Fast Food',
      'image': 'assets/kiosk3.png'
    },
    {
      'name': 'PRINT',
      'hours': '7:00 A.M. - 5:30 P.M.',
      'category': 'Print',
      'image': 'assets/print.png'
    },
    {
      'name': 'SALON',
      'hours': '8:00 A.M. - 5:00 P.M.',
      'category': 'Salon',
      'image': 'assets/salon.png'
    },
    {
      'name': 'CLOTHES',
      'hours': '10:00 A.M. - 6:00 P.M.',
      'category': 'Mall',
      'image': 'assets/clothes.png'
    },
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        selectedCategory = 'All';
        searchQuery = '';
      });
    }
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void _onServiceTapped(BuildContext context, String serviceName) {
    String page;

    switch (serviceName) {
      case 'KIOSK 1':
        page = 'kiosk1';
        break;
      case 'KIOSK 2':
        page = '';
        break;
      case 'KIOSK 3':
        page = '';
        break;
      case 'PRINT':
        page = '';
        break;
      case 'SALON':
        page = '';
        break;
      case 'CLOTHES':
        page = '';
        break;
      default:
        throw Exception('Unknown service');
    }

    Navigator.pushNamed(context, page);
  }

  void _onCategoryTapped(String categoryName) {
    setState(() {
      if (selectedCategory == categoryName) {
        selectedCategory = 'All'; // Reset to default state
      } else {
        selectedCategory = categoryName; // Set the new category
      }
    });
  }

  List<Map<String, String>> get filteredServices {
    List<Map<String, String>> filtered = services;

    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where((service) => service['name']!
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
          .toList();
    }

    if (searchQuery.isEmpty && selectedCategory != 'All') {
      filtered = filtered
          .where((service) => service['category'] == selectedCategory)
          .toList();
    }

    return filtered;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('DIGICOOP'),
      ),
      body: Column(
        children: [
          if (_selectedIndex == 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Color(0xFF0A264A)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Color(0xFF0A264A)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Color(0xFF0A264A)),
                  ),
                  prefixIcon:
                      const Icon(Icons.search, color: Color(0xFF0A264A)),
                ),
                onChanged: (query) {
                  setState(() {
                    searchQuery = query;
                  });
                },
              ),
            ),
          const SizedBox(height: 10),
          if (_selectedIndex == 0)
            CategoryIcons(
              onCategoryTapped: _onCategoryTapped,
              selectedCategory: selectedCategory,
            ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [
                ServicesPage(
                  onServiceTapped: _onServiceTapped,
                  services: filteredServices,
                ),
                NotificationsPage(),
                OrderHistory(),
                Profile(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0A264A),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Order History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CategoryIcons extends StatelessWidget {
  final Function(String) onCategoryTapped;
  final String selectedCategory;

  const CategoryIcons({
    super.key,
    required this.onCategoryTapped,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIcon(Icons.fastfood, 'Fast Food'),
          _buildIcon(Icons.local_cafe, 'Cafe'),
          _buildIcon(Icons.content_cut, 'Salon'),
          _buildIcon(Icons.print, 'Print'),
          _buildIcon(Icons.local_mall, 'Mall'),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, String category) {
    final isSelected = selectedCategory == category;
    return GestureDetector(
      onTap: () => onCategoryTapped(category),
      child: Icon(
        icon,
        color: isSelected ? Colors.blue : Colors.black,
        size: 32,
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  final Function(BuildContext, String) onServiceTapped;
  final List<Map<String, String>> services;

  const ServicesPage({
    super.key,
    required this.onServiceTapped,
    required this.services,
  });

  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) {
      return const Center(
        child: Text(
          'No matching services found.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView(
      children: services.map((service) {
        return GestureDetector(
          onTap: () => onServiceTapped(context, service['name']!),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: AssetImage(service['image']!),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service['name']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      service['hours']!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
