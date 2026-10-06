import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({
    required this.onChanged,
    super.key,
  });

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    // SizedBox digunakan untuk menentukan tinggi kolom pencarian
    return SizedBox(
      height: 50,

      // TextField digunakan untuk memasukkan kata pencarian produk
      child: TextField(
        onChanged: onChanged,

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