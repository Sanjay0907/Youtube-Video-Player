import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Player extends StatefulWidget {
  // const Player({Key? key}) : super(key: key);
  String? VideoID;
  Player({required this.VideoID});

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  String? videoID;
  late YoutubePlayerController _controller;
  final bool _autoplay = false;
  final bool _mute = false;
  final bool _isLive = false;
  bool _isNotPlaying = true;

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: videoID.toString(),
      flags: YoutubePlayerFlags(
        autoPlay: _autoplay,
        mute: _mute,
        isLive: _isLive,
      ),
    );
  }

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        progressIndicatorColor: Colors.amber,
        bottomActions: [
          CurrentPosition(),
          ProgressBar(isExpanded: true),
          RemainingDuration(),
          FullScreenButton(),
        ],
      ),
      builder: (context, player) {
        return Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.purpleAccent,
          // ),
          // body: Column(
          //   children: [
          //     player,
          //     GestureDetector(
          //         onTap: () {
          //           _isNotPlaying ? _controller.play() : _controller.pause();
          //           setState(() {
          //             _isNotPlaying = !_isNotPlaying;
          //           });
          //         },
          //         child: Container(
          //           height: 50,
          //           width: 50,
          //           color: _isNotPlaying ? Colors.blue : Colors.pinkAccent,
          //         ))
          //   ],
          // ),
          body: player,
        );
        // return player;
      },
    );
  }
}
