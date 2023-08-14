import 'package:flutter/material.dart';

class ShopRegisterScreen extends StatelessWidget {
  const ShopRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
        child: Text(
          'Register Screen',
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
