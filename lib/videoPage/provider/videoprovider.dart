import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import '../model/videomodel.dart';

class videoprovider extends ChangeNotifier {
  VideoPlayerController? videoPlayerController;

  ChewieController? chewieControlller;
  homemodel? h1;

  void loadVideo() {
    videoPlayerController = VideoPlayerController.asset(
      "${h1!.video}",
    )..initialize();
    chewieControlller = ChewieController(
      materialProgressColors: ChewieProgressColors(
          backgroundColor: Colors.white30, playedColor: Colors.white),
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
      playbackSpeeds: [10],
      showOptions: true,
      fullScreenByDefault: false,
    );
  }

  List<homemodel> videolist = [
    homemodel(
        image: "assets/image/vposter1.png",
        name: "Memories",
        video: "assets/video/video1.mp4"),
    homemodel(
        image: "assets/image/vposter2.png",
        name: "Cricket",
        video: "assets/video/video2.mp4"),
    homemodel(
        image: "assets/image/vposter3.png",
        name: "Christmas",
        video: "assets/video/video3.mp4"),
    homemodel(
        image: "assets/image/vposter4.png",
        name: "Song",
        video: "assets/video/video4.mp4"),
    homemodel(
        image: "assets/image/vposter5.png",
        name: "Football",
        video: "assets/video/video5.mp4"),
  ];
}
