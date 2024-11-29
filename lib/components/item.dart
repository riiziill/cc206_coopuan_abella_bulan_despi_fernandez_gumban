class Item {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final ItemCategory category;
  List<Addon> availableAddons;

  Item({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

enum ItemCategory {
  category1,
  category2,
  category3,
}

class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
