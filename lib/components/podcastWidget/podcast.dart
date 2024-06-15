import 'package:flutter/material.dart';
import '../../utils/font.dart';
import 'podcastPage.dart';

class PodcastWidget extends StatelessWidget {
  final String name;
  final IconData iconData;

  PodcastWidget({required this.name, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PodcastPage(name: name, iconData: iconData),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: Color.fromARGB(221, 57, 55, 55)),
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
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
