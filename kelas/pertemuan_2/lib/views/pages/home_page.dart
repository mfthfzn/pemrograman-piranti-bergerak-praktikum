import 'package:flutter/material.dart';
import 'package:pertemuan_2/views/widgets/product.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              height: 30,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(27, 31, 35, 0.15),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Cari',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.search,
                      size: 24,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: const [
                Product(nama: "Iphone", deskripsi: "Deskripsi", harga: "10000"),
                Product(nama: "Iphone", deskripsi: "Deskripsi", harga: "10000"),
                Product(nama: "Iphone", deskripsi: "Deskripsi", harga: "10000"),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Keranjang",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
