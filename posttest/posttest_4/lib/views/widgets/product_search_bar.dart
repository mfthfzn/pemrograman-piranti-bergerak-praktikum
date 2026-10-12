import 'package:flutter/material.dart';
import 'package:posttest_4/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {

    // SizedBox digunakan untuk menentukan tinggi kolom pencarian
    return SizedBox(
      height: 50,

      // TextField digunakan untuk memasukkan kata pencarian produk
      child: TextField(
        onChanged: (value) => context.read<CartProvider>().setSearchQuery(value),

        decoration: InputDecoration(
          hintText: 'Cari',

          // TextStyle digunakan untuk mengatur tampilan teks hint
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 18,
          ),

          // Padding digunakan untuk mengatur jarak isi TextField
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),

          // Padding digunakan untuk mengatur jarak ikon pencarian
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 16),

            // Icon digunakan untuk menampilkan ikon pencarian
            child: Icon(
              Icons.search,
              size: 26,
              color: Colors.grey.shade400,
            ),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
  }
}