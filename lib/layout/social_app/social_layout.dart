import 'package:flutter/material.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
      Text(
          'SocialLayout',
        style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),
      )),
    );
  }
}
