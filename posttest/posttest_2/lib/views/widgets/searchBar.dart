import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    // SizedBox digunakan untuk menentukan tinggi area pencarian
    return SizedBox(
      height: 50,

      // TextField digunakan sebagai input pencarian produk
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromRGBO(27, 31, 35, 0.15),
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
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),

          // Padding digunakan untuk memberikan jarak pada ikon pencarian
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 16),

            // Icon digunakan untuk menampilkan ikon pencarian
            child: Icon(Icons.search, size: 24, color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}
