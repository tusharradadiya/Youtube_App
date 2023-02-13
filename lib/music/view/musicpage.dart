import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../musiclistpage/provider/musicprovider.dart';

class Musicpage extends StatefulWidget {
  const Musicpage({Key? key}) : super(key: key);

  @override
  State<Musicpage> createState() => _MusicpageState();
}

class _MusicpageState extends State<Musicpage> {
  musicprovider? providertrue;
  musicprovider? providerfalse;

  @override
  void initState() {
    super.initState();
    Provider.of<musicprovider>(context, listen: false).playsong();
  }

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<musicprovider>(context, listen: true);
    providerfalse = Provider.of<musicprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Now Playing",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "${providertrue!.m1!.image}",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white70,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  child: Image.asset(
                    "${providertrue!.m1!.image}",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${providertrue!.m1!.sname}",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${providertrue!.m1!.singer}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.stop,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        providerfalse!.changeplay(!providertrue!.isplay);
                        if (providerfalse!.isplay) {
                          providerfalse!.assetsAudioPlayer.play();
                        } else {
                          providerfalse!.assetsAudioPlayer.pause();
                        }
                      },
                      child: Icon(
                        providertrue!.isplay ? Icons.pause : Icons.play_arrow,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    InkWell(
                      child: Icon(
                        Icons.headphones,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                PlayerBuilder.currentPosition(
                  player: providertrue!.assetsAudioPlayer,
                  builder: (context, position) => Column(
                    children: [
                      Slider(
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) {
                          providerfalse!.assetsAudioPlayer.seek(
                            Duration(
                              seconds: value.toInt(),
                            ),
                          );
                        },
                        activeColor: Colors.black,
                        max: providertrue!.songDuration!.inSeconds.toDouble(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${position.inMinutes}:${position.inSeconds - position.inMinutes * 60}/",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${providertrue!.songDuration!.inMinutes}:${providertrue!.songDuration!.inSeconds - providertrue!.songDuration!.inMinutes * 60}",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
