import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video_Page extends StatefulWidget {

  String videoID;
  Video_Page({required this.videoID});
  // const Video_Page({Key? key}) : super(key: key);

  @override
  _Video_PageState createState() => _Video_PageState();
}


class _Video_PageState extends State<Video_Page> {
  late YoutubePlayerController _controller;
  final bool _autoplay = true;
  final bool _mute = false;
  final bool _isLive = false;
  final bool _enableCaption = false;
  bool _isNotPlaying = true;

  void runYoutubePlayer(String videoID) {
    _controller = YoutubePlayerController(
      initialVideoId: videoID,
      flags: YoutubePlayerFlags(
        autoPlay: _autoplay,
        mute: _mute,
        isLive: _isLive,
        enableCaption: _enableCaption,
      ),
    );
  }

  // @override
  // void initState() {
  //   runYoutubePlayer();
  //   super.initState();
  // }

  // @override
  // void deactivate() {
  //   _controller.pause();
  //   super.deactivate();
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    runYoutubePlayer(widget.videoID);
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        // progressIndicatorColor: Colors.red,

        bottomActions: [
          CurrentPosition(),
          ProgressBar(isExpanded: true),
          RemainingDuration(),
          // FullScreenButton(),
        ],
      ),
      builder: (context, player) {
        //
        return player;
      },
    );
  }
}
