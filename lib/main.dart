import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_app/videoPage/provider/videoprovider.dart';
import 'package:youtube_app/videoPage/view/videopage.dart';
import 'Navigator/view/navigorPage.dart';
import 'music/view/musicpage.dart';
import 'musiclistpage/provider/musicprovider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => videoprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => musicprovider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => NavigatorPage(),
          'reel': (context) =>  Reelpage(),
          'music': (context) => Musicpage(),
        },
      ),
    ),
  );
}
