import 'package:flutter/material.dart';
import 'package:belajar_kuisTPM/screen/login_page.dart'; // ini juga harus sesuai sama sama folder yang ada di file manager

void main() => runApp(const MinilenstApp());

class MinilenstApp extends StatelessWidget {
  const MinilenstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const LoginPage(),
    );
  }
}
