import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Container digunakan sebagai kartu pembungkus informasi produk
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(12),
      ),

      // Row digunakan untuk menyusun gambar dan informasi produk secara horizontal
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container digunakan sebagai tempat gambar produk
          Container(
            width: 120,
            height: 120,
            color: Colors.grey,
          ),

          // SizedBox digunakan untuk memberikan jarak antara gambar dan informasi produk
          SizedBox(width: 16),

          // Expanded digunakan agar informasi produk mengisi ruang yang tersedia
          Expanded(
            // Column digunakan untuk menyusun informasi produk secara vertikal
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text digunakan untuk menampilkan nama produk
                Text("Nama Produk"),

                // Text digunakan untuk menampilkan deskripsi produk
                Text(
                  "Deskripsi Produk",
                  style: TextStyle(color: Colors.grey.shade400),
                ),

                // Text digunakan untuk menampilkan harga produk
                Text(
                  "Rp12.000.000",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                // SizedBox digunakan untuk memberikan jarak sebelum tombol
                SizedBox(height: 12),

                // ElevatedButton digunakan sebagai tombol untuk memasukkan produk ke keranjang
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 42),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),

                  // Row digunakan untuk menyusun ikon dan teks tombol secara horizontal
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon digunakan untuk menampilkan ikon keranjang
                      Icon(Icons.shopping_cart),

                      // SizedBox digunakan untuk memberikan jarak antara ikon dan teks
                      SizedBox(width: 4),

                      // Text digunakan untuk menampilkan teks tombol
                      Text("Masukkan keranjang"),
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