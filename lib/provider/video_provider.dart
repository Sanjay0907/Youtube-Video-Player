// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:youtube/network/youtube_videos.dart';
import 'package:youtube/network/api.dart';

class VideoProvider with ChangeNotifier {
  bool isLoading = true;
  List<Youtube_Video> videos = [];

  VideoProvider() {
    fetchData();
  }

  void fetchData() async {
    List<dynamic> _videos = await API.getVideo();

    List<Youtube_Video> temp = [];
    for (var video in _videos) {
      Youtube_Video new_video = Youtube_Video.fromJSON(video);
      temp.add(new_video);
    }

    videos = temp;
    isLoading = false;
    notifyListeners();
  }
}
