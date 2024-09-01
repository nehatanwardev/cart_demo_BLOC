import 'package:bloc_cart_demo/ui/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Cart Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomeScreen(),
    );
  }
}
