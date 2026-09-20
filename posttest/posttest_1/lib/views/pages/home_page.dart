import 'package:flutter/material.dart';
import 'package:posttest_1/views/widgets/header.dart';
import 'package:posttest_1/views/widgets/product.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai struktur dasar halaman aplikasi
    return Scaffold(
      // SafeArea digunakan agar konten tidak tertutup oleh area sistem perangkat
      body: SafeArea(
        // SingleChildScrollView digunakan agar halaman dapat digulir
        child: SingleChildScrollView(
          // Column digunakan untuk menyusun Header dan konten secara vertikal
          child: Column(
            children: [
              // Header merupakan widget untuk menampilkan bagian atas halaman
              const Header(),

              // Padding digunakan untuk memberikan jarak di sekitar konten
              Padding(
                padding: EdgeInsets.all(20),

                // Column digunakan untuk menyusun input pencarian dan produk secara vertikal
                child: Column(
                  children: [
                    // SizedBox digunakan untuk menentukan tinggi area pencarian
                    SizedBox(
                      height: 50,

                      // TextField digunakan sebagai input pencarian produk
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromRGBO(
                                27,
                                31,
                                35,
                                0.15,
                              ),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(29, 41, 57, 1),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Cari Sepatu...',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 14,
                          ),

                          // Padding digunakan untuk memberikan jarak pada ikon pencarian
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 16),

                            // Icon digunakan untuk menampilkan ikon pencarian
                            child: Icon(
                              Icons.search,
                              size: 24,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // SizedBox digunakan untuk memberikan jarak antara pencarian dan produk
                    const SizedBox(height: 10),

                    // Product digunakan untuk menampilkan informasi produk
                    const Product(
                      nama: "Nike Air Max",
                      deskripsi: "Sepatu olahraga pria",
                      harga: "Rp1.899.000",
                    ),

                    // SizedBox digunakan untuk memberikan jarak antar produk
                    const SizedBox(height: 10),

                    // Product digunakan untuk menampilkan informasi produk
                    const Product(
                      nama: "Nike Air Max",
                      deskripsi: "Sepatu olahraga pria",
                      harga: "Rp1.899.000",
                    ),

                    // SizedBox digunakan untuk memberikan jarak antar produk
                    const SizedBox(height: 10),

                    // Product digunakan untuk menampilkan informasi produk
                    const Product(
                      nama: "Nike Air Max",
                      deskripsi: "Sepatu olahraga pria",
                      harga: "Rp1.899.000",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // BottomNavigationBar digunakan untuk menampilkan navigasi di bagian bawah halaman
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            // Icon digunakan untuk menampilkan ikon halaman Beranda
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            // Icon digunakan untuk menampilkan ikon halaman Keranjang
            icon: Icon(Icons.shopping_cart),
            label: "Keranjang",
          ),
          BottomNavigationBarItem(
            // Icon digunakan untuk menampilkan ikon halaman Profil
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}