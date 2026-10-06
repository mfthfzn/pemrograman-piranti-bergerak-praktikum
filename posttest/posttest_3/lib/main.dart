import 'package:flutter/material.dart';
import 'package:posttest_3/models/product.dart';
import 'package:posttest_3/views/pages/main.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final products = <Product>[
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
    )
  ];

  final carts = <String, int>{};

  void addToCart(Product product) {
    if (product.stock == 0) return;

    setState(() {
      product.stock--;
      carts[product.id] = (carts[product.id] ?? 0) + 1;
    });
  }

  void changeQuantity(Product product, int quantity) {
    final currentQuantity = carts[product.id] ?? 0;
    final maxQuantity = currentQuantity + product.stock;
    final nextQuantity = quantity.clamp(1, maxQuantity);

    setState(() {
      product.stock += currentQuantity - nextQuantity;
      carts[product.id] = nextQuantity;
    });
  }

  void removeFromCart(Product product) {
    final currentQuantity = carts[product.id] ?? 0;

    setState(() {
      product.stock += currentQuantity;
      carts.remove(product.id);
    });
  }

  int get grandTotal {
    return products.fold(0, (total, product) {
      return total + product.price * (carts[product.id] ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    // MaterialApp digunakan sebagai wrapper utama aplikasi Flutter.
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey,
        ),
      ),

      home: MainPage(
        products: products,
        carts: carts,
        onAddToCart: addToCart,
        onQuantityChanged: changeQuantity,
        onRemoveFromCart: removeFromCart,
        grandTotal: grandTotal,
      ),
    );
  }
}