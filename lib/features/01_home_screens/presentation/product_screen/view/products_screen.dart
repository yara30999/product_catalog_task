import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products", style: TextStyle(fontSize: 24.sp)),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          "Welcome to the Products Screen",
          style: TextStyle(fontSize: 20.sp, color: Colors.black),
        ),
      ),
    );
  }
}
