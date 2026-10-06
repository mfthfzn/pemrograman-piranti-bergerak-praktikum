import 'package:flutter/material.dart';
import 'package:posttest_3/models/product.dart';
import 'package:posttest_3/views/widgets/header.dart';
import 'package:posttest_3/views/widgets/productSearchBar.dart';

import '../widgets/cartProductCard.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    required this.products,
    required this.carts,
    required this.onQuantityChanged,
    required this.onRemoveFromCart,
    required this.grandTotal,
    required this.onCheckout,
    super.key,
  });

  final List<Product> products;
  final Map<String, int> carts;

  final void Function(
      Product product,
      int quantity,
      ) onQuantityChanged;

  final void Function(Product product) onRemoveFromCart;

  final int grandTotal;

  final VoidCallback onCheckout;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String searchQuery = '';

  int get currentGrandTotal {
    return widget.products.fold(0, (total, product) {
      return total +
          product.price * (widget.carts[product.id] ?? 0);
    });
  }

  String formatRupiah(int value) {
    final digits = value.toString();
    final groups = <String>[];

    for (var end = digits.length; end > 0; end -= 3) {
      final start = end - 3 < 0 ? 0 : end - 3;
      groups.insert(0, digits.substring(start, end));
    }

    return 'Rp ${groups.join('.')}';
  }

  @override
  Widget build(BuildContext context) {
    final cartProducts = widget.products.where((product) {
      final quantity = widget.carts[product.id] ?? 0;

      return quantity > 0 &&
          product.name.toLowerCase().contains(searchQuery);
    }).toList();

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
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),

              // ProductSearchBar digunakan sebagai kolom pencarian produk di keranjang
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
              // ListView digunakan agar daftar produk dapat digulir
              child: ListView.separated(
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
                  // CartproductCard digunakan untuk menampilkan informasi produk dalam keranjang
                  return CartProductCard(
                      product: cartProducts[index],
                      quantity: widget.carts[
                      cartProducts[index].id] ?? 0,
                      onQuantityChanged: (quantity) {
                    widget.onQuantityChanged(
                      cartProducts[index],
                      quantity,
                    );
                  },
                  onRemove: () {
                  widget.onRemoveFromCart(
                  cartProducts[index],
                  );
                  },
                  );
                },
              ),
            ),

            // Container digunakan sebagai pembungkus informasi total dan tombol checkout
            Container(
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
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),

                        // SizedBox digunakan untuk memberikan jarak antara label dan harga
                        const SizedBox(height: 4),

                        // Text digunakan untuk menampilkan jumlah total harga
                        Text(
                          formatRupiah(currentGrandTotal),
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
                      onPressed: widget.carts.isEmpty
                          ? null
                          : widget.onCheckout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor:
                        Colors.grey.shade400,
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
                          Icon(
                            Icons.shopping_cart,
                            size: 20,
                          ),

                          // SizedBox digunakan untuk memberikan jarak antara ikon dan teks
                          SizedBox(width: 12),

                          // Text digunakan untuk menampilkan tulisan Checkout
                          Text(
                            'Checkout',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
