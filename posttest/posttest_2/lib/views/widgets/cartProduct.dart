import 'package:flutter/material.dart';

class CartproductCard extends StatelessWidget {
  const CartproductCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Container digunakan sebagai kartu pembungkus informasi produk di keranjang
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),

      // Row digunakan untuk menyusun gambar, informasi produk, dan jumlah produk secara horizontal
      child: Row(
        children: [
          // Image digunakan untuk menampilkan gambar produk
          Image.asset(
            "assets/product.jpg",
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
                  "Nike Air Max",
                  style: TextStyle(fontSize: 20),
                ),

                // SizedBox digunakan untuk memberikan jarak antara nama dan deskripsi produk
                const SizedBox(height: 4),

                // Text digunakan untuk menampilkan deskripsi produk
                Text(
                  "Sepatu olahraga pria",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade400,
                  ),
                ),

                // SizedBox digunakan untuk memberikan jarak antara deskripsi dan harga produk
                const SizedBox(height: 4),

                // Text digunakan untuk menampilkan harga produk
                Text(
                  "Rp 1.899.000",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // SizedBox digunakan untuk memberikan jarak antara informasi produk dan jumlah produk
          const SizedBox(width: 20),

          // SizedBox digunakan untuk menentukan ukuran kolom jumlah produk
          SizedBox(
            width: 48,
            height: 48,

            // TextField digunakan untuk memasukkan jumlah produk
            child: TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "1",
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}