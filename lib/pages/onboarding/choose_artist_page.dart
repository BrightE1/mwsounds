import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../model/const.dart';
import '../../utils/font.dart';

class ChooseShowsPage extends StatefulWidget {
  @override
  _ChooseShowsPageState createState() => _ChooseShowsPageState();
}

class _ChooseShowsPageState extends State<ChooseShowsPage> {
  final Set<String> _selectedShows = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Choose Favorite Shows',
          style: FontStyles.heading1,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Iconsax.microphone),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SearchBar(),
          ),
          SizedBox(height: 10),
          Flexible(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
              itemCount: kAllSearh.length,
              itemBuilder: (context, index) {
                final show = kAllSearh[index];
                final isSelected = _selectedShows.contains(show.title);
                return ShowTile(
                  show: show,
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedShows.remove(show.title);
                      } else {
                        _selectedShows.add(show.title);
                      }
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _selectedShows.length >= 3
            ? () {
                Navigator.of(context).pushReplacementNamed('/main');
              }
            : null,
        label: Text('Finish'),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: FontStyles.bodyText2,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Iconsax.search_favorite, color: Colors.black38),
        suffixIcon: IconButton(
          icon: Icon(Iconsax.microphone),
          onPressed: () {},
        ),
      ),
    );
  }
}

class ShowTile extends StatelessWidget {
  final SearchListItem show;
  final bool isSelected;
  final VoidCallback onTap;

  ShowTile({
    required this.show,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: show.color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? Color.fromARGB(255, 43, 181, 22)
                : Colors.transparent,
            width: 3,
          ),
        ),
        child: IntrinsicHeight(
          child: isSelected
              ? Center(
                  child: Icon(Icons.check, color: Colors.white, size: 30),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      show.img,
                      fit: BoxFit.cover,
                      height: 57,
                    ),
                    SizedBox(height: 5),
                    Text(
                      show.title,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
