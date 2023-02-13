import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_app/videoPage/provider/videoprovider.dart';

class Reelpage extends StatefulWidget {
  const Reelpage({Key? key}) : super(key: key);

  @override
  State<Reelpage> createState() => _ReelpageState();
}

class _ReelpageState extends State<Reelpage> {
  videoprovider? providertrue;
  videoprovider? providerfalse;

  @override
  void initState() {
    Provider.of<videoprovider>(context, listen: false).loadVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<videoprovider>(context, listen: true);
    providerfalse = Provider.of<videoprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Chewie(controller: providertrue!.chewieControlller!),
        ),
      ),
    );
  }

  @override
  void dispose() {
    providerfalse!.chewieControlller!.pause();
    super.dispose();
  }
}
