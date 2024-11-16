import 'package:flutter/material.dart';

class ServiceDetailPage extends StatelessWidget {
  final String serviceName;
  final String imagePath;
  final String serviceHours;

  const ServiceDetailPage({
    Key? key,
    required this.serviceName,
    required this.imagePath,
    required this.serviceHours,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for items (Food, Drinks, Haircuts, Print Services, Clothes)
    final List<Map<String, String>> foods = [
      {'name': 'ITEM #1', 'image': 'assets/item1.png'},
      {'name': 'ITEM #2', 'image': 'assets/item2.png'},
      {'name': 'ITEM #3', 'image': 'assets/item3.png'},
      {'name': 'ITEM #4', 'image': 'assets/item4.png'},
      {'name': 'ITEM #5', 'image': 'assets/item5.png'},
      {'name': 'ITEM #6', 'image': 'assets/item6.png'},
    ];

    final List<Map<String, String>> drinks = [
      {'name': 'ITEM #A', 'image': 'assets/itemA.png'},
      {'name': 'ITEM #B', 'image': 'assets/itemB.png'},
      {'name': 'ITEM #C', 'image': 'assets/itemC.png'},
      {'name': 'ITEM #D', 'image': 'assets/itemD.png'},
      {'name': 'ITEM #E', 'image': 'assets/itemE.png'},
      {'name': 'ITEM #F', 'image': 'assets/itemF.png'},
    ];

    final List<Map<String, String>> haircuts = [
      {'name': 'Basic Haircut', 'image': 'assets/haircut1.png'},
      {'name': 'Shave & Trim', 'image': 'assets/haircut2.png'},
      {'name': 'Full Styling', 'image': 'assets/haircut3.png'},
      {'name': 'Buzz Cut', 'image': 'assets/haircut4.png'},
      {'name': 'Fade Cut', 'image': 'assets/haircut5.png'},
      {'name': 'Undercut', 'image': 'assets/haircut6.png'},
    ];

    final List<Map<String, String>> printServices = [
      {'name': 'Business Cards', 'image': 'assets/print_card.png'},
      {'name': 'Flyers', 'image': 'assets/print_flyer.png'},
      {'name': 'Posters', 'image': 'assets/print_poster.png'},
      {'name': 'Banners', 'image': 'assets/print_banner.png'},
      {'name': 'Stickers', 'image': 'assets/print_sticker.png'},
      {'name': 'Brochures', 'image': 'assets/print_brochure.png'},
    ];

    final List<Map<String, String>> clothes = [
      {'name': 'T-Shirt', 'image': 'assets/clothes_tshirt.png'},
      {'name': 'Jacket', 'image': 'assets/clothes_jacket.png'},
      {'name': 'Jeans', 'image': 'assets/clothes_jeans.png'},
      {'name': 'Shirt', 'image': 'assets/clothes_shirt.png'},
      {'name': 'Sweater', 'image': 'assets/clothes_sweater.png'},
      {'name': 'Cap', 'image': 'assets/clothes_cap.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(serviceName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Container(
            width: double.infinity,
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
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  serviceName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  serviceHours,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Check service type and display appropriate content
          if (serviceName == 'SALON')
            _buildHaircuts(haircuts)
          else if (serviceName == 'PRINT')
            _buildPrintServices(printServices)
          else if (serviceName == 'CLOTHES')
            _buildClothes(clothes)
          else
            _buildFoodAndDrinks(foods, drinks),
        ],
      ),
    );
  }

  // Function to build haircuts category
  Widget _buildHaircuts(List<Map<String, String>> haircuts) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Text(
              'HAIRCUTS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: haircuts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items in a row
                mainAxisSpacing: 16, // Spacing between rows
                crossAxisSpacing: 16, // Spacing between columns
                childAspectRatio: 2 / 2.5, // Aspect ratio of each grid item
              ),
              itemBuilder: (context, index) {
                final item = haircuts[index];
                return ItemTile(name: item['name']!, imagePath: item['image']!);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Function to build print services category
  Widget _buildPrintServices(List<Map<String, String>> printServices) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Text(
              'PRINT SERVICES',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: printServices.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items in a row
                mainAxisSpacing: 16, // Spacing between rows
                crossAxisSpacing: 16, // Spacing between columns
                childAspectRatio: 2 / 2.5, // Aspect ratio of each grid item
              ),
              itemBuilder: (context, index) {
                final item = printServices[index];
                return ItemTile(name: item['name']!, imagePath: item['image']!);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Function to build clothes category
  Widget _buildClothes(List<Map<String, String>> clothes) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Text(
              'CLOTHING',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: clothes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items in a row
                mainAxisSpacing: 16, // Spacing between rows
                crossAxisSpacing: 16, // Spacing between columns
                childAspectRatio: 2 / 2.5, // Aspect ratio of each grid item
              ),
              itemBuilder: (context, index) {
                final item = clothes[index];
                return ItemTile(name: item['name']!, imagePath: item['image']!);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Function to build food and drinks categories
  Widget _buildFoodAndDrinks(List<Map<String, String>> foods, List<Map<String, String>> drinks) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Text(
              'FOODS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: foods.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items in a row
                mainAxisSpacing: 16, // Spacing between rows
                crossAxisSpacing: 16, // Spacing between columns
                childAspectRatio: 2 / 2.5, // Aspect ratio of each grid item
              ),
              itemBuilder: (context, index) {
                final item = foods[index];
                return ItemTile(name: item['name']!, imagePath: item['image']!);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Text(
              'DRINKS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: drinks.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items in a row
                mainAxisSpacing: 16, // Spacing between rows
                crossAxisSpacing: 16, // Spacing between columns
                childAspectRatio: 2 / 2.5, // Aspect ratio of each grid item
              ),
              itemBuilder: (context, index) {
                final item = drinks[index];
                return ItemTile(name: item['name']!, imagePath: item['image']!);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final String name;
  final String imagePath;

  const ItemTile({
    Key? key,
    required this.name,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        ElevatedButton(
          onPressed: () {
            // Handle buy action
          },
          child: const Text('BUY'),
        ),
      ],
    );
  }
}
