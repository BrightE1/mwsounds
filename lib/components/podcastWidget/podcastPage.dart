import 'package:flutter/material.dart';

class PodcastPage extends StatelessWidget {
  final String name;
   final IconData iconData;

  PodcastPage({required this.name, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black12),
                  child: Icon(
              iconData,
              color: Colors.grey,
              size: 40,
            ),
            ),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Add more details about the artist here
          ],
        ),
      ),
    );
  }
}
