import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/item.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/cart_page.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/item_tile.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/tab_bar.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/item_page.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/service_detail_page.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/item_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/sliver_app_bar.dart';
import 'package:provider/provider.dart';

class Kiosk1 extends StatefulWidget {
  const Kiosk1({super.key});

  @override
  State<Kiosk1> createState() => _Kiosk1State();
}

class _Kiosk1State extends State<Kiosk1> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Tab> _buildCategoryTabs() {
    return Kiosk1ItemCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  List<Item> _filterItemByCategory(
      Kiosk1ItemCategory category, List<Item> fullItem) {
    return fullItem.where((item) => item.category == category).toList();
  }

  List<Widget> getItemInThisCategory(List<Item> fullItem) {
    return Kiosk1ItemCategory.values.map(
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
    _tabController = TabController(length: 4, vsync: this);
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
            serviceName: Text('Kiosk 1'),
            categories: Container(
              child: TabBar(
                controller: _tabController,
                tabs: _buildCategoryTabs(),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kiosk 1 is your one-stop destination for authentic Filipino dishes. "
                        "Enjoy classic flavors made with the freshest ingredients, served with love and care.",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.access_time, color: Colors.grey, size: 16),
                          SizedBox(width: 5),
                          Text(
                            "Open: 9:00 AM - 9:00 PM",
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
                            "Location: Food Court, Level 2",
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
          builder: (context, kiosk1items, child) => TabBarView(
            controller: _tabController,
            children: getItemInThisCategory(kiosk1items.menu),
          ),
        ),
      ),
    );
  }
}
