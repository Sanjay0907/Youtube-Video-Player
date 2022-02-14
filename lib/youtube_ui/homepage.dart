// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube/about/about_me.dart';
import 'package:youtube/constant.dart';
import 'package:youtube/model/app_bar_text.dart';
import 'package:youtube/network/youtube_videos.dart';
import 'package:youtube/no_glow_scroll_physics.dart';
import 'package:youtube/provider/video_provider.dart';
import 'package:provider/provider.dart';
import 'package:youtube/youtube_player.dart';
import 'package:youtube/video_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => About_Me())));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white38, width: 2)),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(kaka_img),
                    ),
                  ),
                ),
                Animated_Text(),
                IconButton(
                    onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.bars))
              ],
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Consumer<VideoProvider>(
                  builder: (context, videoProvider, child) {
                    if (videoProvider.isLoading == true) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (videoProvider.videos.length > 0) {
                        return ScrollConfiguration(
                          behavior: NoGlowScrollBehavior(),
                          child: ListView.builder(
                            itemCount: videoProvider.videos.length - 1,
                            itemBuilder: (context, index) {
                              Youtube_Video currentVideo =
                                  videoProvider.videos[index];

                              return Stack(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height /
                                        2.86,
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 10),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4.1,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: Color(0xff06122C),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            image: DecorationImage(
                                              image: NetworkImage(currentVideo
                                                  .thumbnail_medium!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          
                                          child: currentVideo.isTapped ? Video_Page(videoID: currentVideo.videoId!) : null,
                                        ),
                                        Container(
                                          height: 50,
                                          margin:
                                              const EdgeInsets.only(left: 60),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            currentVideo.title!,
                                            maxLines: 2,
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.roboto(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    bottom: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Video_Page(videoID: currentVideo.videoId!);
                                        setState(() {
                                          currentVideo.isTapped =
                                              !currentVideo.isTapped;
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, bottom: 7),
                                        height: 50,
                                        width: 50,
                                        child: currentVideo.isTapped
                                            ? Image.asset(
                                                "assets/images/pause_b_white.png")
                                            : Image.asset(
                                                "assets/images/play_b_white.png"),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      } else {
                        return Text("Data Not Found");
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
