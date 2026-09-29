import 'package:flutter/material.dart';
import 'package:posttest_2/views/pages/cartPage.dart';
import 'package:posttest_2/views/pages/profile.dart';
import 'package:posttest_2/views/widgets/header.dart';
import 'package:posttest_2/views/widgets/product.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai struktur dasar halaman aplikasi
    return Scaffold(
      backgroundColor: Colors.white,
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
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Cari",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.search,
                            size: 24,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                      ),
                    ),

                    // SizedBox digunakan untuk memberikan jarak antara pencarian dan produk
                    const SizedBox(height: 20),

                    // Product digunakan untuk menampilkan informasi produk
                    const Product(
                      nama: "Nike Air Max",
                      deskripsi: "Sepatu olahraga pria",
                      harga: "Rp1.899.000",
                    ),

                    // SizedBox digunakan untuk memberikan jarak antar produk
                    const SizedBox(height: 20),

                    // Product digunakan untuk menampilkan informasi produk
                    const Product(
                      nama: "Nike Air Max",
                      deskripsi: "Sepatu olahraga pria",
                      harga: "Rp1.899.000",
                    ),

                    // SizedBox digunakan untuk memberikan jarak antar produk
                    const SizedBox(height: 20),

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
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
        },
        destinations: const [
          // NavigationDestination digunakan untuk navigasi menuju halaman beranda
          NavigationDestination(icon: Icon(Icons.home), label: "Beranda"),

          // NavigationDestination digunakan untuk navigasi menuju halaman keranjang
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: "Keranjang",
          ),

          // NavigationDestination digunakan untuk menampilkan halaman profile yang sedang aktif
          NavigationDestination(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
