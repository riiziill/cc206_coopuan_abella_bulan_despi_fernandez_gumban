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

  final T category;
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
  main,
  soup,
  noodles,
  appetizer,
}

enum Kiosk2ItemCategory {
  main,
  soup,
  snack,
}

enum Kiosk3ItemCategory {
  main,
  soup,
}

class Addon {
  final String name;
  final double price;

  Addon({
    required this.name,
    required this.price,
  });
}
