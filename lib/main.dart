import 'package:flutter/material.dart';
import 'package:latihan_kuis_123230016_ayudya_cans/screen/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage()
    ,
    );
  }
}