import 'package:flutter/material.dart';
import 'package:playrx/utils/font.dart';

class ArtistDetailsPage extends StatelessWidget {
  final String name;
  final IconData iconData;

  ArtistDetailsPage({required this.name, required this.iconData});

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
            SizedBox(height: 8),
            Text(
              name,
              style: FontStyles.bodyText,
            ),
            // Add more details about the artist here
          ],
        ),
      ),
    );
  }
}
