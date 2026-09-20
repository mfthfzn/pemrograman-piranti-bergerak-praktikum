import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String nama;
  final String deskripsi;
  final String harga;

  const Product({
    super.key,
    required this.nama,
    required this.deskripsi,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 70,
          height: 70,
          color: Colors.grey,
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),

              Text(
                deskripsi,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),

              Text(
                harga,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: 16,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Masukkan Keranjang",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}