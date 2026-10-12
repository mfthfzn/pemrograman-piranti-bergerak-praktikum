import 'package:flutter/material.dart';
import 'package:posttest_4/providers/cart_provider.dart';
import 'package:posttest_4/utils/format_util.dart';
import 'package:posttest_4/views/pages/total.dart';
import 'package:posttest_4/views/widgets/header.dart';
import 'package:posttest_4/views/widgets/product_search_bar.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_product_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {

    // Scaffold digunakan sebagai struktur dasar halaman keranjang
    return Scaffold(
      backgroundColor: Colors.white,

      // SafeArea digunakan agar isi halaman tidak tertutup oleh area sistem
      body: SafeArea(
        // Column digunakan untuk menyusun header, pencarian, daftar produk, dan total secara vertikal
        child: Column(
          children: [
            // Header digunakan untuk menampilkan bagian header halaman
            const Header(),

            // Padding digunakan untuk memberikan jarak di sekitar kolom pencarian
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

              // ProductSearchBar digunakan sebagai kolom pencarian produk di keranjang
              child: ProductSearchBar(),
            ),

            // Expanded digunakan agar daftar produk mengisi ruang yang tersedia
            Expanded(
              // Consumer<CartProvider> digunakan untuk memperbarui tampilan keranjang ketika jumlah produk atau isi keranjang berubah pada halaman Cart.
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  final searchQuery = cartProvider.searchQuery
                      .trim()
                      .toLowerCase();

                  final cartProducts = cartProvider.products.where((product) {
                    final quantity = cartProvider.carts[product.id] ?? 0;

                    return quantity > 0 &&
                        (product.name.toLowerCase().contains(searchQuery) ||
                            product.description.toLowerCase().contains(
                              searchQuery,
                            ));
                  }).toList();
                  // ListView digunakan agar daftar produk dapat digulir
                  return ListView.separated(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    itemCount: cartProducts.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 28);
                    },
                    itemBuilder: (context, index) {
                      final product = cartProducts[index];

                      // CartproductCard digunakan untuk menampilkan informasi produk dalam keranjang
                      return CartProductCard(
                        product: product,
                        quantity: cartProvider.carts[product.id] ?? 0,
                      );
                    },
                  );
                },
              ),
            ),

            // Consumer<CartProvider> digunakan untuk memperbarui total harga ketika jumlah produk atau isi keranjang berubah pada halaman Cart.
            Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                // Container digunakan sebagai pembungkus informasi total dan tombol checkout
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,

                    // BoxShadow digunakan untuk memberikan bayangan pada bagian atas panel total
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),

                  // Row digunakan untuk menyusun informasi total dan tombol checkout secara horizontal
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Expanded digunakan agar informasi total menggunakan ruang yang tersedia
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text digunakan untuk menampilkan label total
                            const Text('Total', style: TextStyle(fontSize: 16)),

                            // SizedBox digunakan untuk memberikan jarak antara label dan harga
                            const SizedBox(height: 4),

                            // Text digunakan untuk menampilkan jumlah total harga
                            Text(
                              FormatUtils.formatRupiah(cartProvider.grandTotal),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // SizedBox digunakan untuk memberikan jarak antara total dan tombol checkout
                      const SizedBox(width: 20),

                      // SizedBox digunakan untuk menentukan ukuran tombol checkout
                      SizedBox(
                        width: 180,
                        height: 46,

                        // ElevatedButton digunakan sebagai tombol checkout
                        child: ElevatedButton(
                          onPressed: cartProvider.carts.isEmpty
                              ? null
                              : () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const TotalPage();
                                      },
                                    ),
                                  );
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: Colors.grey.shade400,
                            disabledForegroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),

                          // Row digunakan untuk menyusun ikon dan teks tombol checkout secara horizontal
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon digunakan untuk menampilkan ikon keranjang
                              Icon(Icons.shopping_cart, size: 20),

                              // SizedBox digunakan untuk memberikan jarak antara ikon dan teks
                              SizedBox(width: 12),

                              // Text digunakan untuk menampilkan tulisan Checkout
                              Text('Checkout', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
