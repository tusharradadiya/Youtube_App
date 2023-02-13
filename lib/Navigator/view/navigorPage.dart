import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../home/view/homepage.dart';
import '../../music/view/musicpage.dart';
import '../../musiclistpage/view/musiclistpage.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  List pagelist = [Homepage(), MusiclistPage()];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pagelist[i],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              i = index;
            });
          },
          currentIndex: i,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.video_collection_outlined), label: "Video"),
            BottomNavigationBarItem(
                icon: Icon(Icons.audiotrack_rounded), label: "Audio"),
          ],

        ),
      ),
    );
  }
}
