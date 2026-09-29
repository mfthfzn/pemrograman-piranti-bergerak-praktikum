import 'package:posttest_2/views/pages/profile.dart';
import 'package:posttest_2/views/widgets/cartProduct.dart';
import 'package:flutter/material.dart';
import 'package:posttest_2/views/widgets/header.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai struktur dasar halaman keranjang
    return Scaffold(
      backgroundColor: Colors.white,

      // SafeArea digunakan agar tampilan tidak tertutup oleh area sistem perangkat
      body: SafeArea(
        // Column digunakan untuk menyusun header, pencarian, dan isi halaman secara vertikal
        child: Column(
          children: [
            // Header digunakan untuk menampilkan bagian header halaman
            Header(),

            // Padding digunakan sebagai pembungkus kolom pencarian
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

              // TextField digunakan untuk memasukkan kata pencarian produk
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Cari",
                  hintStyle: TextStyle(color: Colors.grey.shade400),

                  // Padding digunakan untuk mengatur jarak ikon pencarian
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 16),

                    // Icon digunakan untuk menampilkan ikon pencarian
                    child: Icon(
                      Icons.search,
                      size: 24,
                      color: Colors.grey.shade400,
                    ),
                  ),

                  // OutlineInputBorder digunakan untuk memberikan garis dan bentuk pada kolom pencarian
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),

                  // OutlineInputBorder digunakan untuk mengatur tampilan kolom pencarian saat aktif
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),
            ),

            // Expanded digunakan agar bagian isi keranjang mengisi ruang yang tersedia
            Expanded(
              // Stack digunakan untuk menempatkan daftar produk dan bagian total secara bertumpuk
              child: Stack(
                children: [
                  // SingleChildScrollView digunakan agar daftar produk dapat digulir
                  SingleChildScrollView(
                    // Padding digunakan untuk memberikan jarak pada daftar produk
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 20,
                        left: 20,
                        bottom: 32,
                      ),

                      // Column digunakan untuk menyusun produk keranjang secara vertikal
                      child: Column(
                        children: [
                          // CartproductCard digunakan untuk menampilkan informasi produk di keranjang
                          const CartproductCard(),

                          // SizedBox digunakan untuk memberikan jarak setelah produk
                          const SizedBox(height: 28),
                        ],
                      ),
                    ),
                  ),

                  // Positioned digunakan untuk menempatkan bagian total di bagian bawah halaman
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,

                    // Container digunakan sebagai pembungkus informasi total dan tombol
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 36,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 10,
                            offset: const Offset(0, -3),
                          ),
                        ],
                      ),

                      // Row digunakan untuk menyusun informasi total dan tombol secara horizontal
                      child: Row(
                        children: [
                          // Expanded digunakan agar bagian total mengisi ruang yang tersedia
                          Expanded(
                            // Column digunakan untuk menyusun label dan jumlah total secara vertikal
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text digunakan untuk menampilkan label total
                                Text(
                                  "Total",
                                  style: TextStyle(fontSize: 16),
                                ),

                                // SizedBox digunakan untuk memberikan jarak antara label dan harga
                                const SizedBox(height: 4),

                                // Text digunakan untuk menampilkan jumlah total harga
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

                          // Expanded digunakan agar tombol mengisi ruang yang tersedia
                          Expanded(
                            // SizedBox digunakan untuk menentukan tinggi tombol
                            child: SizedBox(
                              height: 46,

                              // ElevatedButton digunakan sebagai tombol untuk memasukkan produk ke keranjang
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),

                                // Row digunakan untuk menyusun ikon dan teks tombol secara horizontal
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Icon digunakan untuk menampilkan ikon keranjang
                                    Icon(
                                      Icons.shopping_cart,
                                      size: 20,
                                    ),

                                    // SizedBox digunakan untuk memberikan jarak antara ikon dan teks tombol
                                    const SizedBox(width: 12),

                                    // Text digunakan untuk menampilkan teks tombol
                                    Text(
                                      "Masukkan Keranjang",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
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

      // NavigationBar digunakan untuk menampilkan navigasi antar halaman aplikasi
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: 1,
        onDestinationSelected: (index) {
          final navigator = Navigator.of(context);

          if (index == 0) {
            navigator.pop();
          } else if (index == 2) {
            navigator.pop();
            navigator.push(
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          }
        },

        destinations: const [
          // NavigationDestination digunakan untuk navigasi menuju halaman beranda
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),

          // NavigationDestination digunakan untuk menampilkan halaman keranjang yang
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: "Keranjang",
          ),

          // NavigationDestination digunakan untuk navigasi menuju halaman profile
          NavigationDestination(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}