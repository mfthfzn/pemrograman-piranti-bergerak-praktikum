import 'package:flutter/material.dart';

class TotalPage extends StatelessWidget {
  const TotalPage({
    required this.grandTotal,
    super.key,
  });

  final int grandTotal;

  String formatRupiah(int value) {
    final digits = value.toString();
    final groups = <String>[];

    for (var end = digits.length; end > 0; end -= 3) {
      final start = end - 3 < 0 ? 0 : end - 3;
      groups.insert(0, digits.substring(start, end));
    }

    return 'Rp ${groups.join('.')}';
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai struktur dasar halaman checkout
    return Scaffold(
      backgroundColor: Colors.white,

      // SafeArea digunakan agar isi halaman tidak tertutup area sistem
      body: SafeArea(
        // Center digunakan untuk menempatkan isi halaman di tengah
        child: Center(
          // Padding digunakan untuk memberikan jarak dari sisi layar
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),

            // Column digunakan untuk menyusun informasi checkout secara vertikal
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container digunakan sebagai lingkaran tanda checkout berhasil
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1D1B20),
                    shape: BoxShape.circle,
                  ),

                  // Icon digunakan untuk menampilkan tanda berhasil
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 90,
                  ),
                ),

                // SizedBox digunakan untuk memberikan jarak setelah ikon
                const SizedBox(height: 48),

                // Text digunakan untuk menampilkan pesan checkout
                const Text(
                  'Terima kasih sudah checkout!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    height: 1.2,
                  ),
                ),

                // SizedBox digunakan untuk memberikan jarak sebelum total
                const SizedBox(height: 26),

                // Text digunakan untuk menampilkan total pembayaran
                Text(
                  formatRupiah(grandTotal),
                  style: const TextStyle(
                    fontSize: 32,
                    height: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // SizedBox digunakan untuk memberikan jarak sebelum tombol
                const SizedBox(height: 34),

                // SizedBox digunakan untuk membuat tombol memenuhi lebar yang tersedia
                SizedBox(
                  width: double.infinity,
                  height: 78,

                  // ElevatedButton digunakan sebagai tombol kembali
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),

                    // Text digunakan untuk menampilkan tulisan Kembali
                    child: const Text(
                      'Kembali',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}