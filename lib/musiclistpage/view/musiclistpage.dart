import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/musicprovider.dart';

class MusiclistPage extends StatefulWidget {
  const MusiclistPage({Key? key}) : super(key: key);

  @override
  State<MusiclistPage> createState() => _MusiclistPageState();
}

class _MusiclistPageState extends State<MusiclistPage> {
  musicprovider? providertrue;
  musicprovider? providerfalse;

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<musicprovider>(context, listen: true);
    providerfalse = Provider.of<musicprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Music Player",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: providertrue!.musiclist.length,
                  itemBuilder: (context, index) => Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1,
                            blurRadius: 5,
                            blurStyle: BlurStyle.solid),
                      ],
                    ),
                    child: ListTile(
                      onTap: () {
                        providerfalse!.m1 = providerfalse!.musiclist[index];
                        Navigator.pushNamed(context, 'music');
                      },
                      title: Text("${providertrue!.musiclist[index].sname}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      subtitle:
                          Text("${providertrue!.musiclist[index].singer}"),
                      leading: Container(
                        height: 60,
                        width: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  "${providertrue!.musiclist[index].image}")),
                        ),
                      ),
                      trailing: Icon(Icons.play_circle, size: 30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
