import 'package:flutter/material.dart';
import 'service_detail_page.dart';

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
    {'name': 'KIOSK 1', 'hours': '9:00 A.M. - 4:00 P.M.', 'category': 'Fast Food', 'image': 'assets/kiosk1.png'},
    {'name': 'KIOSK 2', 'hours': '8:00 A.M. - 5:00 P.M.', 'category': 'Fast Food', 'image': 'assets/kiosk2.png'},
    {'name': 'KIOSK 3', 'hours': '9:00 A.M. - 4:00 P.M.', 'category': 'Fast Food', 'image': 'assets/kiosk3.png'},
    {'name': 'PRINT', 'hours': '7:00 A.M. - 5:30 P.M.', 'category': 'Print', 'image': 'assets/print.png'},
    {'name': 'SALON', 'hours': '8:00 A.M. - 5:00 P.M.', 'category': 'Salon', 'image': 'assets/salon.png'},
    {'name': 'CLOTHES', 'hours': '10:00 A.M. - 6:00 P.M.', 'category': 'Mall', 'image': 'assets/clothes.png'},
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

  void _onServiceTapped(BuildContext context, String serviceName, String imagePath, String serviceHours) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceDetailPage(
          serviceName: serviceName,
          imagePath: imagePath,
          serviceHours: serviceHours,
        ),
      ),
    );
  }

  void _onCategoryTapped(String categoryName) {
    setState(() {
      selectedCategory = categoryName;
    });
  }

  List<Map<String, String>> get filteredServices {
    List<Map<String, String>> filtered = services.where((service) => selectedCategory == 'All' || service['category'] == selectedCategory).toList();
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((service) => service['name']!.toLowerCase().contains(searchQuery.toLowerCase())).toList();
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
        title: const Text('DIGICOOP'),
      ),
      body: Column(
        children: [
          Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: TextField(
    decoration: InputDecoration(
      hintText: 'Search...',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Color(0xFF0A264A)), // Set outline color here
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Color(0xFF0A264A)), // Set outline color when enabled
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Color(0xFF0A264A), width: 2.0), // Set outline color when focused
      ),
      prefixIcon: const Icon(Icons.search, color: Color(0xFF0A264A)), // Change icon color as well
    ),
    onChanged: (query) {
      setState(() {
        searchQuery = query;
      });
    },
  ),
),

          const SizedBox(height: 10),
          // Category icons are visible only when on Home tab
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
                const Center(child: Text('Notifications Page')),
                const Center(child: Text('Order History Page')),
                const Center(child: Text('User Profile Page')),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,  // Ensures the colors apply as expected
  backgroundColor: const Color(0xFF0A264A),  // Set the background color to #0a264a
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
  selectedItemColor: Colors.white, // Set selected icon color to white
  unselectedItemColor: Colors.white54, // Optionally, make unselected icons slightly faded
  onTap: _onItemTapped,
),


    );
  }
}

class ServicesPage extends StatelessWidget {
  final Function(BuildContext, String, String, String) onServiceTapped;
  final List<Map<String, String>> services;

  const ServicesPage({super.key, required this.onServiceTapped, required this.services});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: services.map((service) => ServiceTile(
        imagePath: service['image']!,
        serviceName: service['name']!,
        serviceHours: service['hours']!,
        onTap: (name, imagePath, hours) => onServiceTapped(context, name, imagePath, hours),
      )).toList(),
    );
  }
}

class CategoryIcons extends StatelessWidget {
  final Function(String) onCategoryTapped;
  final String selectedCategory;

  const CategoryIcons({super.key, required this.onCategoryTapped, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildAnimatedIcon(Icons.fastfood, 'Fast Food'),
          _buildAnimatedIcon(Icons.local_cafe, 'Cafe'),
          _buildAnimatedIcon(Icons.local_pizza, 'Pizza'),
          _buildAnimatedIcon(Icons.print, 'Print'),
          _buildAnimatedIcon(Icons.local_mall, 'Mall'),
          _buildAnimatedIcon(Icons.local_offer, 'Offers'),
        ],
      ),
    );
  }

  Widget _buildAnimatedIcon(IconData icon, String category) {
    final isSelected = selectedCategory == category;
    return GestureDetector(
      onTap: () => onCategoryTapped(category),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[300] : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : const Color(0xFF0A264A),
        ),
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final String imagePath;
  final String serviceName;
  final String serviceHours;
  final Function(String, String, String) onTap;

  const ServiceTile({
    super.key,
    required this.imagePath,
    required this.serviceName,
    required this.serviceHours,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(serviceName, imagePath, serviceHours),
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Container(
          height: 150, 
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
              ),
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  serviceName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  serviceHours,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ServiceDetailPage extends StatelessWidget {
  final String serviceName;
  final String imagePath;
  final String serviceHours;

  const ServiceDetailPage({super.key, required this.serviceName, required this.imagePath, required this.serviceHours});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              serviceName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              serviceHours,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network('https://via.placeholder.com/150'), // Placeholder for Kiosk image
                Text('KIOSK 1'),
                Text('9:00 A.M. - 4:00 P.M.'),
              ],
            ),
          ),
          SectionTitle(title: 'FOODS'),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return MenuItem(
                imageUrl: 'https://via.placeholder.com/100', // Placeholder for food image
                itemNumber: index + 1,
              );
            },
          ),
          SectionTitle(title: 'DRINKS'),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return MenuItem(
                imageUrl: 'https://via.placeholder.com/100', // Placeholder for drink image
                itemNumber: index + 1,
              );
            },
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String imageUrl;
  final int itemNumber;

  MenuItem({required this.imageUrl, required this.itemNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(imageUrl),
          Text('ITEM #$itemNumber'),
          ElevatedButton(
            onPressed: () {},
            child: Text('BUY'),
          ),
        ],
      ),
    );
  }
}
