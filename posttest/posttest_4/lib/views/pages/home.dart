import 'package:flutter/material.dart';
import 'package:posttest_4/providers/cart_provider.dart';
import 'package:posttest_4/views/widgets/header.dart';
import 'package:posttest_4/views/widgets/product_search_bar.dart';
import '../widgets/product_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: ProductSearchBar(),
            ),

            // Expanded digunakan agar daftar produk mengisi ruang yang tersedia
            Expanded(
              // Consumer<CartProvider> digunakan untuk memperbarui tampilan daftar produk ketika data produk atau stok berubah pada halaman Home.
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  final searchQuery =
                      cartProvider.searchQuery.trim().toLowerCase();

                  final visibleProducts =
                      cartProvider.products.where((product) {
                    return product.stock > 0 &&
                        product.name.toLowerCase().contains(searchQuery);
                  }).toList();

                  // ListView.separated digunakan untuk membuat daftar produk yang dapat digulir
                  return ListView.separated(
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
                      );
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