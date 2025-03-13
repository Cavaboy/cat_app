// lib/pages/cat_list_page.dart
import 'package:flutter/material.dart';
import '../data/cat.dart';
import '../pages/cat_detail_page.dart';

class CatListPage extends StatefulWidget {
  @override
  _CatListPageState createState() => _CatListPageState();
}

class _CatListPageState extends State<CatListPage> {
  // Track favorite cats
  Set<int> favoriteCats = {};

  void toggleFavorite(int index) {
    setState(() {
      if (favoriteCats.contains(index)) {
        favoriteCats.remove(index);
      } else {
        favoriteCats.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cats for Adoption'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: catList.length,
        itemBuilder: (context, index) {
          final cat = catList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CatDetailPage(cat: cat),
                ),
              );
            },
            child: Card(
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      cat.pictureUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cat.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Age: ${cat.age} years'),
                        Text('Breed: ${cat.breed}'),
                        Text('Sex: ${cat.sex}'),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      favoriteCats.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: favoriteCats.contains(index)
                          ? Colors.red
                          : null,
                    ),
                    onPressed: () => toggleFavorite(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}