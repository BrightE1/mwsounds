import 'package:flutter/material.dart';
import 'artistPage.dart';

class ArtistWidget extends StatelessWidget {
  final String name;
  final IconData iconData;

  ArtistWidget({required this.name, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ArtistDetailsPage(name: name, iconData: iconData),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Color.fromARGB(221, 57, 55, 55)),
            child: Icon(
              iconData,
              color: Colors.grey,
              size: 40,
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
