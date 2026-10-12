import 'package:flutter/material.dart';
import 'package:posttest_4/providers/cart_provider.dart';
import 'package:posttest_4/utils/format_util.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    required this.product,
    required this.quantity,
    super.key,
  });

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    // Container digunakan sebagai kartu pembungkus informasi produk di keranjang
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(10),
      ),

      // Row digunakan untuk menyusun gambar, informasi produk, dan jumlah produk secara horizontal
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image digunakan untuk menampilkan gambar produk
          Image.asset(
            product.imagePath,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),

          // SizedBox digunakan untuk memberikan jarak antara gambar dan informasi produk
          const SizedBox(width: 20),

          // Expanded digunakan agar informasi produk mengisi ruang yang tersedia
          Expanded(
            // Column digunakan untuk menyusun informasi produk secara vertikal
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text digunakan untuk menampilkan nama produk
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),

                // SizedBox digunakan untuk memberikan jarak antara nama dan deskripsi produk
                const SizedBox(height: 4),

                // Text digunakan untuk menampilkan deskripsi produk
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade400,
                  ),
                ),

                // SizedBox digunakan untuk memberikan jarak antara deskripsi dan harga produk
                const SizedBox(height: 4),

                // Text digunakan untuk menampilkan harga produk
                Text(
                  FormatUtils.formatRupiah(product.price),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // SizedBox digunakan untuk memberikan jarak antara informasi produk dan jumlah produk
          const SizedBox(width: 20),

          // Column digunakan untuk menyusun jumlah produk dan tombol hapus secara vertikal
          Column(
            children: [
              // SizedBox digunakan untuk menentukan ukuran kolom jumlah produk
              SizedBox(
                width: 48,
                height: 48,

                // TextField digunakan untuk memasukkan jumlah produk
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: TextEditingController(
                    text: quantity.toString(),
                  ),
                  onSubmitted: (value) {
                    final newQuantity = int.tryParse(value);

                    if (newQuantity != null && newQuantity > 0) {
                      context.read<CartProvider>().changeQuantity(product, newQuantity);
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ),

              // SizedBox digunakan untuk memberikan jarak sebelum tombol hapus
              const SizedBox(height: 4),

              // IconButton digunakan untuk menghapus produk dari keranjang
              IconButton(
                onPressed: () => context.read<CartProvider>().removeFromCart(product),
                tooltip: 'Hapus',

                // Icon digunakan untuk menampilkan ikon hapus
                icon: const Icon(
                  Icons.delete_outline,
                  size: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}