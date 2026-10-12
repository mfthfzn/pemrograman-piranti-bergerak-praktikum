import 'package:flutter/material.dart';
import 'package:posttest_4/providers/cart_provider.dart';
import 'package:posttest_4/views/pages/home.dart';
import 'package:posttest_4/views/pages/cart.dart';
import 'package:posttest_4/views/pages/profile.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      // HomePage digunakan sebagai halaman utama aplikasi
      HomePage(),

      // CartPage digunakan sebagai halaman keranjang
      CartPage(),

      // ProfilePage digunakan sebagai halaman profil
      const ProfilePage(),
    ];

    // Scaffold digunakan sebagai struktur utama halaman
    return Scaffold(
      // IndexedStack digunakan untuk menampilkan halaman berdasarkan currentIndex
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      // NavigationBar digunakan untuk berpindah antar halaman utama aplikasi
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: currentIndex,

        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
            context.read<CartProvider>().clearSearch();
          });
        },

        // NavigationDestination digunakan untuk menentukan setiap tujuan navigasi
        destinations: const [
          // NavigationDestination digunakan untuk halaman Beranda
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),

          // NavigationDestination digunakan untuk halaman Keranjang
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Keranjang',
          ),

          // NavigationDestination digunakan untuk halaman Profil
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}