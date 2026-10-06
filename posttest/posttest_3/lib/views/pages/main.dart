import 'package:flutter/material.dart';
import 'package:posttest_3/models/product.dart';
import 'package:posttest_3/views/pages/home.dart';
import 'package:posttest_3/views/pages/cart.dart';
import 'package:posttest_3/views/pages/profile.dart';
import 'package:posttest_3/views/pages/total.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    required this.products,
    required this.carts,
    required this.onAddToCart,
    required this.onQuantityChanged,
    required this.onRemoveFromCart,
    required this.grandTotal,
    super.key,
  });

  final List<Product> products;
  final Map<String, int> carts;

  final ValueChanged<Product> onAddToCart;

  final void Function(
    Product product,
    int quantity,
  ) onQuantityChanged;

  final void Function(Product product) onRemoveFromCart;

  final int grandTotal;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      // HomePage digunakan sebagai halaman utama aplikasi
      HomePage(
        products: widget.products,
        onAddToCart: widget.onAddToCart,
      ),

      // CartPage digunakan sebagai halaman keranjang
      CartPage(
        products: widget.products,
        carts: widget.carts,
        onQuantityChanged: widget.onQuantityChanged,
        onRemoveFromCart: widget.onRemoveFromCart,
        grandTotal: widget.grandTotal,
        onCheckout: () {
          Navigator.push(
            context,
            // MaterialPageRoute digunakan untuk membuka TotalPage
            MaterialPageRoute(
              builder: (context) {
                // TotalPage digunakan untuk menampilkan hasil checkout
                return TotalPage(
                  grandTotal: widget.grandTotal,
                );
              },
            ),
          );
        },
      ),

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