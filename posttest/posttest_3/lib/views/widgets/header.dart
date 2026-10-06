import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    // SizedBox digunakan untuk menentukan tinggi Header
    return SizedBox(
      height: 60,

      // Container digunakan sebagai pembungkus dan memberikan tampilan pada Header
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(27, 31, 35, 0.15),
              offset: const Offset(0, 0),
              blurRadius: 0,
              spreadRadius: 1,
            ),
          ],
        ),

        // Row digunakan untuk menyusun nama pengguna dan ikon secara horizontal
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text digunakan untuk menampilkan nama pengguna
            Text(
              "User12345678",
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromRGBO(29, 41, 57, 1),
                fontWeight: FontWeight.w600,
              ),
            ),

            // Container digunakan sebagai pembungkus ikon profil
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
              ),

              // Icon digunakan untuk menampilkan ikon profil
              child: const Icon(
                Icons.person,
                size: 28,
                color: Color.fromRGBO(29, 41, 57, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}