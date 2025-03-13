// lib/pages/cat_detail_page.dart
import 'package:flutter/material.dart';
import '../models/cat.dart';

class CatDetailPage extends StatelessWidget {
  final Cat cat;

  CatDetailPage({required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cat.name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              cat.pictureUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'Name: ${cat.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Age: ${cat.age} years'),
            Text('Breed: ${cat.breed}'),
            Text('Color: ${cat.color}'),
            Text('Sex: ${cat.sex}'),
            SizedBox(height: 16),
            Text(
              'Vaccines:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  cat.vaccines.map((vaccine) => Text('- $vaccine')).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Characteristics:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  cat.characteristics.map((char) => Text('- $char')).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Background:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(cat.background),
          ],
        ),
      ),
    );
  }
}
