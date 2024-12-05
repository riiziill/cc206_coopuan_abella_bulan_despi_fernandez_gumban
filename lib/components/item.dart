abstract class DisplayableItem {
  String get serviceName;
  String get name;
  String get description;
  String get imagePath;
  double get price;
}

class Item<T> implements DisplayableItem {
  @override
  final String serviceName;
  @override
  final String name;
  @override
  final String description;
  @override
  final String imagePath;
  @override
  final double price;

  final T category; // Generic type for category
  final List<Addon> availableAddons;

  Item({
    required this.serviceName,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

enum Kiosk1ItemCategory {
  category1,
  category2,
  category3,
}

enum Kiosk2ItemCategory {
  kiosk2CategoryX,
  kiosk2CategoryY,
  kiosk2CategoryZ,
}

enum Kiosk3ItemCategory {
  kiosk3CategoryX,
  kiosk3CategoryY,
  kiosk3CategoryZ,
}

class Addon {
  final String name;
  final double price;

  Addon({
    required this.name,
    required this.price,
  });
}
