import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageFeedScreen(),
    );
  }
}

class ImageFeedScreen extends StatelessWidget {
  final List<String> _imageUrls = List.generate(20, (index) =>
  'https://via.placeholder.com/150 ${(index + 1)}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
        centerTitle: false,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
              childAspectRatio: 1.0
            ),
            itemCount: _imageUrls.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Image.network(
                    _imageUrls[index],
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
