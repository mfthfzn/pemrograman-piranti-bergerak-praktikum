import 'package:flutter/foundation.dart';
import 'package:posttest_4/models/product.dart';

// CartProvider mengelola state produk, keranjang, dan pencarian.
class CartProvider extends ChangeNotifier {
  final List<Product> products = [
    Product(
      id: 'P0001',
      imagePath: 'assets/product.jpg',
      name: 'Nike Air Max',
      stock: 5,
      description: 'Sepatu olahraga pria',
      price: 1200000,
    ),
    Product(
      id: 'P0002',
      imagePath: 'assets/product.jpg',
      name: 'Nike Air Jordan',
      stock: 5,
      description: 'Sepatu olahraga pria',
      price: 1500000,
    ),
  ];

  final Map<String, int> carts = {};

  String searchQuery = '';

  List<Product> searchProducts() {
    if (searchQuery.trim().isEmpty) {
      return products;
    }

    final query = searchQuery.toLowerCase().trim();

    return products.where((product) {
      return product.name.toLowerCase().contains(query) ||
          product.description.toLowerCase().contains(query);
    }).toList();
  }

  void setSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }

  void clearSearch() {
    searchQuery = '';
    notifyListeners();
  }

  void addToCart(Product product) {
    if (product.stock == 0) return;

    product.stock--;
    carts[product.id] = (carts[product.id] ?? 0) + 1;

    notifyListeners();
  }

  void changeQuantity(Product product, int quantity) {
    final currentQuantity = carts[product.id] ?? 0;

    if (currentQuantity == 0) return;

    final maxQuantity = currentQuantity + product.stock;
    final nextQuantity = quantity.clamp(1, maxQuantity);

    if (nextQuantity == currentQuantity) return;

    product.stock += currentQuantity - nextQuantity;
    carts[product.id] = nextQuantity;

    notifyListeners();
  }

  void removeFromCart(Product product) {
    final currentQuantity = carts[product.id] ?? 0;

    if (currentQuantity == 0) return;

    product.stock += currentQuantity;
    carts.remove(product.id);

    notifyListeners();
  }

  int get grandTotal {
    return products.fold(0, (total, product) {
      return total + product.price * (carts[product.id] ?? 0);
    });
  }

  void completeCheckout() {
    if (carts.isEmpty) return;

    carts.clear();
    notifyListeners();
  }
}
