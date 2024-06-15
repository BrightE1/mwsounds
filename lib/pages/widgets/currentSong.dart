import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomSheetPlayer extends StatefulWidget {
  final String songName;
  final String artistName;
  final IconData iconData;

  BottomSheetPlayer({
    required this.songName,
    required this.artistName,
    required this.iconData,
  });

  @override
  BottomSheetPlayerState createState() => BottomSheetPlayerState();
}

class BottomSheetPlayerState extends State<BottomSheetPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isPlaying = false;

  // IconData? get iconData => null;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void _toggleBottomSheet() {
    if (_controller.isDismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  void _togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: _toggleBottomSheet,
            child: Container(
              height: 92 +
                  (MediaQuery.of(context).size.height - 60) * _animation.value,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue,Colors.black],begin: Alignment.topCenter,end: Alignment.bottomCenter)
              ),
              child: _animation.value == 0
                  ? _buildMiniPlayer()
                  : _buildExpandedPlayer(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMiniPlayer() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                // shape:BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(221, 57, 55, 55)),
            child: Icon(
              widget.iconData,
              color: Colors.grey,
              size: 40,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.songName,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)), // Use widget.songName
                Text(widget.artistName,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70)), // Use widget.artistName
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Iconsax.heart5),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(isPlaying ? Iconsax.pause : Iconsax.play),
            onPressed: _togglePlayPause,
          ),
        ],
      ),
    );
  }

 Widget _buildExpandedPlayer() {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.expand_more),
            onPressed: _toggleBottomSheet,
          ),
        ],
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height:250,
                width: 250,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(221, 57, 55, 55),
                ),
                child: Icon(
                  widget.iconData,
                  color: Colors.grey,
                  size: 40,
                ),
              ),
              const SizedBox(height: 20),
              Text(widget.songName, style: const TextStyle(fontSize: 20)),
              Text(widget.artistName, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Iconsax.shuffle),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Iconsax.previous),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(isPlaying ? Iconsax.pause : Iconsax.play),
                    onPressed: _togglePlayPause,
                  ),
                  IconButton(
                    icon: const Icon(Iconsax.next),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Iconsax.repeat),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Iconsax.heart5),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Iconsax.import),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    ],
  );
}
}
