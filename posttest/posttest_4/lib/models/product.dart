class Product {

  Product({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
    required this.stock,
  });

  final String id;
  final String name;
  final String imagePath;
  final String description;
  final int price;
  int stock;
  
}