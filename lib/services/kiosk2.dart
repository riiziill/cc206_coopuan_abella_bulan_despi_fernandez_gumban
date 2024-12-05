import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/item.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/cart_page.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/item_tile.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/kiosk1_item_page.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/tab_bar.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/service_detail_page.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/item_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/sliver_app_bar.dart';
import 'package:provider/provider.dart';

class Kiosk2 extends StatefulWidget {
  const Kiosk2({super.key});

  @override
  State<Kiosk2> createState() => _Kiosk2State();
}

class _Kiosk2State extends State<Kiosk2> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Tab> _buildCategoryTabs() {
    return Kiosk2ItemCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  List<Item> _filterItemByCategory(
      Kiosk2ItemCategory category, List<Item> fullItem) {
    return fullItem.where((item) => item.category == category).toList();
  }

  List<Widget> getItemInThisCategory(List<Item> fullItem) {
    return Kiosk2ItemCategory.values.map(
      (category) {
        List<Item> categoryItem = _filterItemByCategory(category, fullItem);

        return ListView.builder(
          itemCount: categoryItem.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final item = categoryItem[index];
            return ItemTile(
              item: item,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ItemPage(item: item)),
              ),
            );
          },
        );
      },
    ).toList();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            redirectPage: CartPage(),
            serviceName: Text('Kiosk 2'),
            categories: Container(
              child: TabBar(
                controller: _tabController,
                tabs: _buildCategoryTabs(),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kiosk 2 specializes in refreshing beverages and sweet treats. "
                        "Perfect for a quick pick-me-up or a delightful dessert after a meal.",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.access_time, color: Colors.grey, size: 16),
                          SizedBox(width: 5),
                          Text(
                            "Open: 10:00 AM - 8:00 PM",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.grey, size: 16),
                          SizedBox(width: 5),
                          Text(
                            "Location: Food Court, Level 1",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        body: Consumer<ServiceItems>(
          builder: (context, kiosk2items, child) => TabBarView(
            controller: _tabController,
            children: getItemInThisCategory(kiosk2items.menu),
          ),
        ),
      ),
    );
  }
}
