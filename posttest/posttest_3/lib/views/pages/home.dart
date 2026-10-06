import 'package:flutter/material.dart';
import 'package:posttest_3/models/product.dart';
import 'package:posttest_3/views/widgets/header.dart';
import 'package:posttest_3/views/widgets/productSearchBar.dart';
import '../widgets/productCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required this.products,
    required this.onAddToCart,
    super.key,
  });

  final List<Product> products;
  final ValueChanged<Product> onAddToCart;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final visibleProducts = widget.products.where((product) {
      return product.stock > 0 && product.name.toLowerCase().contains(searchQuery);
    }).toList();

    // Scaffold digunakan sebagai struktur dasar halaman Home
    return Scaffold(
      backgroundColor: Colors.white,

      // SafeArea digunakan agar isi halaman tidak tertutup oleh area sistem
      body: SafeArea(
        // Column digunakan untuk menyusun header, pencarian, dan daftar produk secara vertikal
        child: Column(
          children: [
            // Header digunakan untuk menampilkan bagian header halaman
            const Header(),

            // Padding digunakan untuk memberikan jarak di sekitar kolom pencarian
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),

              // ProductSearchBar digunakan sebagai kolom pencarian produk
              child: ProductSearchBar(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
              ),
            ),

            // Expanded digunakan agar daftar produk mengisi ruang yang tersedia
            Expanded(
              // ListView.separated digunakan untuk membuat daftar produk yang dapat digulir
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),
                itemCount: visibleProducts.length,
                separatorBuilder: (context, index) {
                  // SizedBox digunakan untuk memberikan jarak
                  return const SizedBox(height: 28);
                },
                itemBuilder: (context, index) {
                  final product = visibleProducts[index];

                  // ProductCard digunakan untuk menampilkan informasi produk
                  return ProductCard(
                    product: product,
                    onAddToCart: () {
                      widget.onAddToCart(product);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}