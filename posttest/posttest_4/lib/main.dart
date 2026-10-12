import 'package:flutter/material.dart';
import 'package:posttest_4/views/pages/main.dart';
import 'package:provider/provider.dart';
import 'package:posttest_4/providers/cart_provider.dart';

void main() {
  runApp(
    // ChangeNotifierProvider menyediakan CartProvider ke seluruh widget anak.
    ChangeNotifierProvider<CartProvider>(
      create: (context) => CartProvider(),

      // MainApp menjadi widget utama yang berada di bawah Provider.
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp digunakan sebagai wrapper utama aplikasi.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey,
        ),
      ),

      home: const MainPage(),
    );
  }
}

