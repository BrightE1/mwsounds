import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:playrx/utils/font.dart';
import '../components/section_builder.dart';
import '../model/const.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Search text
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 16, bottom: 20),
              child: Text("Search", style: FontStyles.heading2),
            ),
          ),
          // search-text-field
          SliverAppBar(
            backgroundColor: const Color(0xff121212),
            expandedHeight: 56,
            floating: true,
            pinned: true,
            elevation: 0,
            leading: Container(), // Remove back arrow
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              centerTitle: true,
              titlePadding: EdgeInsets.symmetric(vertical: 5),
              title: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        style: const TextStyle(
                          color: Color(0xff747474),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Raleway",
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Iconsax.search_favorite,
                              color: Colors.black38),
                          contentPadding: EdgeInsets.only(top: 15),
                          hintText: 'Artist, Song, or pod',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 18,
                left: 16,
                right: 16,
                bottom: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionBuilder(
                    sectionTitle: 'Playlist Added',
                    titlePadding: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.only(bottom: 16),
                    sectionBodyBuilder: (context) {
                      return SearchSectionItemBuilder(
                        list: kPlaylistSdded,
                      );
                    },
                  ),
                  SectionBuilder(
                    sectionTitle: 'Browse All',
                    padding: EdgeInsets.zero,
                    titlePadding: const EdgeInsets.only(bottom: 10),
                    sectionBodyBuilder: (context) {
                      return SearchSectionItemBuilder(
                        list: kAllSearh,
                      );
                    },
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

class SearchSectionItemBuilder extends StatelessWidget {
  const SearchSectionItemBuilder({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<SearchListItem> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // ignore: division_optimization
      height: 120 * ((list.length / 2).toInt()).toDouble(),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.8,
          crossAxisSpacing: 8,
          mainAxisSpacing: 11,
        ),
        itemCount: list.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            decoration: BoxDecoration(
              color: list[index].color,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            child: Stack(
              children: [
                // img
                Positioned(
                  right: -15,
                  bottom: -10,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(25 / 360),
                    child: Container(
                      width: 83,
                      height: 83,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(list[index].img),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
                // text
                Padding(
                  padding: const EdgeInsets.only(top: 6, left: 11),
                  child: Text(
                    list[index].title,
                    style: const TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Raleway",
                      fontStyle: FontStyle.normal,
                      fontSize: 13.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
