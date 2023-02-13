import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/widgets.dart';
import '../model/musicmodel.dart';

class musicprovider extends ChangeNotifier {
  bool isplay = false;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  void changeplay(value) {
    isplay = value;
    notifyListeners();
  }

  void playsong() {
    assetsAudioPlayer.open(
      autoStart: false,
      showNotification: true,
      Audio(
        "${m1!.songlink}",
      ),
    );
    totalduration();
  }

  musicmodel? m1;

  List<musicmodel> musiclist = [
    musicmodel(
        image: "assets/image/sposter1.png",
        singer: "Arijit Singh",
        sname: "Kesariya Tera Ishq",
        songlink: "assets/audio/audio1.mp3"),
    musicmodel(
        image: "assets/image/sposter2.png",
        singer: "Akhil & dhvani Bhanushali",
        sname: "Duniya",
        songlink: "assets/audio/audio2.mp3"),
    musicmodel(
        image: "assets/image/sposter3.png",
        singer: "Palak muchhal",
        sname: "kaun Tunjhe",
        songlink: "assets/audio/audio3.mp3"),
    musicmodel(
        image: "assets/image/sposter4.png",
        singer: "Armaann Malik",
        sname: "Bol Do Na Zara",
        songlink: "assets/audio/audio4.mp3"),
    musicmodel(
        image: "assets/image/sposter5.png",
        singer: "Sunanda Sharma",
        sname: "Mummy Nu Pasand",
        songlink: "assets/audio/audio5.mp3"),
    musicmodel(
        image: "assets/image/sposter6.png",
        singer: "Imaran khan",
        sname: "Satisfya",
        songlink: "assets/audio/audio6.mp3"),
    musicmodel(
        image: "assets/image/sposter1.png",
        singer: "Arijit Singh",
        sname: "Kesariya Tera Ishq",
        songlink: "assets/audio/audio1.mp3"),

  ];
  Duration songDuration = Duration(seconds: 0);

  void totalduration() {
    assetsAudioPlayer.current.listen((event) {
      songDuration = event!.audio.duration;
    });
  }
}
