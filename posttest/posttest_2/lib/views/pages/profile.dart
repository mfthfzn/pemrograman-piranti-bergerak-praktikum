import 'package:flutter/material.dart';
import 'package:posttest_2/views/pages/cartPage.dart';
import 'package:posttest_2/views/widgets/header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai struktur dasar halaman profile
    return Scaffold(
      backgroundColor: Colors.white,

      // SafeArea digunakan agar tampilan tidak tertutup oleh area sistem perangkat
      body: SafeArea(
        // Column digunakan untuk menyusun header dan informasi profile secara vertikal
        child: Column(
          children: [
            // Header digunakan untuk menampilkan bagian header halaman
            Header(),

            // Padding digunakan sebagai pembungkus informasi profile
            Padding(
              padding: const EdgeInsets.all(20),

              // Row digunakan untuk menyusun gambar dan informasi profile secara horizontal
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container digunakan sebagai tempat gambar profile
                  Image.asset(
                    "assets/profile.png",
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),

                  // SizedBox digunakan untuk memberikan jarak antara gambar dan informasi profile
                  const SizedBox(width: 20),

                  // Expanded digunakan agar informasi profile mengisi ruang yang tersedia
                  Expanded(
                    // Column digunakan untuk menyusun informasi profile secara vertikal
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text digunakan untuk menampilkan label nama
                        Text(
                          "Nama",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),

                        // SizedBox digunakan untuk memberikan jarak antara label dan nama
                        const SizedBox(height: 4),

                        // Text digunakan untuk menampilkan nama pengguna
                        const Text(
                          "Miftahul Fauzan",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // SizedBox digunakan untuk memberikan jarak antara informasi nama dan email
                        const SizedBox(height: 16),

                        // Text digunakan untuk menampilkan label email
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),

                        // SizedBox digunakan untuk memberikan jarak antara label dan email
                        const SizedBox(height: 4),

                        // Text digunakan untuk menampilkan email pengguna
                        const Text(
                          "miftahul@example.com",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // NavigationBar digunakan untuk menampilkan navigasi antara halaman utama aplikasi
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: 2,
        onDestinationSelected: (index) {
          final navigator = Navigator.of(context);

          if (index == 0) {
            navigator.pop();
          } else if (index == 1) {
            navigator.pop();
            navigator.push(
              MaterialPageRoute(builder: (context) => const CartPage()),
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
