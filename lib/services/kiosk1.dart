import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/item.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/item_tile.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/components/tab_bar.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/item_page.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/features/service_detail_page.dart';
import 'package:cc206_magic_calculator_abella_bulan_despi_fernandez_gumban/services/kiosk1_items.dart';
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
    return ItemCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  List<Item> _filterItemByCategory(ItemCategory category, List<Item> fullItem) {
    return fullItem.where((item) => item.category == category).toList();
  }

  List<Widget> getItemInThisCategory(List<Item> fullItem) {
    return ItemCategory.values.map(
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
            serviceName: Text('Kiosk 1'),
            categories: Container(
              child: TabBar(
                  controller: _tabController, tabs: _buildCategoryTabs()),
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
                      Text("Kiosk description"),
                      Row(
                        children: [
                          Text("idkidk"),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        body: Consumer<Kiosk1Items>(
          builder: (context, kiosk1items, child) => TabBarView(
            controller: _tabController,
            children: getItemInThisCategory(kiosk1items.menu),
          ),
        ),
      ),
    );
  }
}
