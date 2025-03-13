// lib/main.dart
import 'package:flutter/material.dart';
import 'pages/cat_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Adoption App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CatListPage(),
    );
  }
}