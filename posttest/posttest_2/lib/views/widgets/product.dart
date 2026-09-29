import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String nama;
  final String deskripsi;
  final String harga;

  const Product({
    super.key,
    required this.nama,
    required this.deskripsi,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    // Container digunakan sebagai kartu pembungkus informasi produk
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(27, 31, 35, 0.15),
            offset: const Offset(0, 0),
            blurRadius: 0,
            spreadRadius: 1,
          ),
        ],
      ),

      // Row digunakan untuk menyusun gambar dan informasi produk secara horizontal
      child: Row(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container digunakan sebagai tempat gambar produk
          Image.asset(
            "assets/product.jpg",
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),

          // Expanded digunakan agar informasi produk mengisi ruang yang tersedia
          Expanded(
            // Column digunakan untuk menyusun informasi produk secara vertikal
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text digunakan untuk menampilkan nama produk
                Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // Text digunakan untuk menampilkan deskripsi produk
                Text(
                  deskripsi,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                // Text digunakan untuk menampilkan harga produk
                Text(
                  harga,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),

                // SizedBox digunakan untuk memberikan jarak sebelum tombol
                const SizedBox(height: 10),

                // Container digunakan sebagai pembungkus tombol keranjang
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),

                  // Row digunakan untuk menyusun ikon dan teks tombol secara horizontal
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon digunakan untuk menampilkan ikon keranjang
                      Icon(
                        Icons.shopping_cart,
                        size: 14,
                        color: Colors.white,
                      ),

                      // SizedBox digunakan untuk memberikan jarak antara ikon dan teks
                      SizedBox(width: 6),

                      // Text digunakan untuk menampilkan teks tombol
                      Text(
                        "Masukkan Keranjang",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}