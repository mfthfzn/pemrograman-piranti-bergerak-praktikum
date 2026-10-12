import 'package:flutter/material.dart';
import 'package:posttest_4/views/widgets/header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai struktur dasar halaman profile
    return Scaffold(
      backgroundColor: Colors.white,

      // SafeArea digunakan agar isi halaman tidak tertutup area sistem
      body: SafeArea(
        // SingleChildScrollView digunakan agar halaman dapat digulir jika konten melebihi layar
        child: SingleChildScrollView(
          // Column digunakan untuk menyusun header dan informasi profile secara vertikal
          child: Column(
            children: [
              // Header digunakan untuk menampilkan header halaman
              const Header(),

              // Padding digunakan untuk memberikan jarak pada informasi profile
              Padding(
                padding: const EdgeInsets.all(20),

                // Row digunakan untuk menyusun gambar dan informasi profile secara horizontal
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.asset digunakan untuk menampilkan foto profile
                    Image.asset(
                      'assets/profile.png',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),

                    // SizedBox digunakan untuk memberikan jarak antara gambar dan informasi
                    const SizedBox(width: 20),

                    // Expanded digunakan agar informasi profile mengisi ruang yang tersedia
                    Expanded(
                      // Column digunakan untuk menyusun informasi profile secara vertikal
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text digunakan untuk menampilkan label nama
                          Text(
                            'Nama',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),

                          // SizedBox digunakan untuk memberikan jarak antara label dan nama
                          const SizedBox(height: 4),

                          // Text digunakan untuk menampilkan nama pengguna
                          const Text(
                            'Miftahul Fauzan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // SizedBox digunakan untuk memberikan jarak antara nama dan email
                          const SizedBox(height: 16),

                          // Text digunakan untuk menampilkan label email
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),

                          // SizedBox digunakan untuk memberikan jarak antara label dan email
                          const SizedBox(height: 4),

                          // Text digunakan untuk menampilkan email pengguna
                          const Text(
                            'miftahul@example.com',
                            style: TextStyle(
                              fontSize: 16,
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
        ),
      ),
    );
  }
}