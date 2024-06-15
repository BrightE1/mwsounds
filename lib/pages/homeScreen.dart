import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:playrx/components/artistWidget/artist.dart';
import 'package:playrx/utils/font.dart';
import '../components/podcastWidget/podcast.dart';
import '../components/playlistWidget/playlist.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            floating: true,
            pinned: true,
            snap: false,
            expandedHeight: 60.0,
            leading: Icon(
              Iconsax.play,
              color: Colors.white,
            ),
            // flexibleSpace: FlexibleSpaceBar(
            //   title: Text('PlayX', style: FontStyles.heading2),
            //   // titlePadding: EdgeInsets.only(left: 1.0, bottom: 16.0, top: 10),
            // ),
            actions: <Widget>[
              IconButton(
                highlightColor: Colors.white10,
                icon: Icon(
                  Iconsax.notification_bing,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Add your onPressed code here!
                },
              ),
              IconButton(
                highlightColor: Colors.white10,
                icon: Icon(Iconsax.clock, color: Colors.white),
                onPressed: () {
                  // Add your onPressed code here!
                },
              ),
              IconButton(
                highlightColor: Colors.white10,
                icon: Icon(Iconsax.setting_2, color: Colors.white),
                onPressed: () {
                  // Add your onPressed code here!
                },
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Recent played', style: FontStyles.heading1),
                      SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PlaylistWidget(
                                  name: "Playlist", iconData: Iconsax.music),
                              SizedBox(width: 10),
                              ArtistWidget(
                                  name: "Artist", iconData: Iconsax.mirror),
                              SizedBox(width: 10),
                              PodcastWidget(
                                  name: "Sound", iconData: Iconsax.happyemoji),
                              SizedBox(width: 10),
                              PodcastWidget(
                                  name: "Liked", iconData: Iconsax.heart),
                              SizedBox(width: 10),
                              PodcastWidget(
                                  name: "Podacast",
                                  iconData: Iconsax.microphone),
                              SizedBox(width: 10),
                            ]),
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Made for you',
                            style: FontStyles.heading1,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                PodcastWidget(
                                    name: "Radio", iconData: Iconsax.radio),
                                SizedBox(width: 10),
                                PodcastWidget(
                                    name: "Liked", iconData: Iconsax.heart),
                                SizedBox(width: 10),
                                PodcastWidget(
                                    name: "Podacast",
                                    iconData: Iconsax.microphone),
                                SizedBox(width: 10),
                                PodcastWidget(
                                    name: "Radio", iconData: Iconsax.radio),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your favourite artists',
                            style: FontStyles.heading1,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ArtistWidget(
                                    name: "Name1", iconData: Iconsax.mirror),
                                SizedBox(width: 10),
                                ArtistWidget(
                                    name: "Name2", iconData: Iconsax.mirror),
                                SizedBox(width: 10),
                                ArtistWidget(
                                    name: "Name3", iconData: Iconsax.mirror),
                                SizedBox(width: 10),
                                ArtistWidget(
                                    name: "Name4", iconData: Iconsax.mirror),
                              ],
                            ),
                          ),
                        ],
                      )
                      // Add more content here as needed
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Radio',
                        style: FontStyles.heading1,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            PodcastWidget(
                                name: "Radio", iconData: Iconsax.radio),
                            SizedBox(width: 10),
                            PodcastWidget(
                                name: "Liked", iconData: Iconsax.radio),
                            SizedBox(width: 10),
                            PodcastWidget(
                                name: "Podacast", iconData: Iconsax.microphone),
                            SizedBox(width: 10),
                            PodcastWidget(
                                name: "Radio", iconData: Iconsax.radio),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
