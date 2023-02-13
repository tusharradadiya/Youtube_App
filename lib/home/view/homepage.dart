import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_app/videoPage/provider/videoprovider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  videoprovider? providereTrue;
  videoprovider? providereFalse;

  @override
  Widget build(BuildContext context) {
    providereTrue = Provider.of<videoprovider>(context, listen: true);
    providereFalse = Provider.of<videoprovider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Video Player",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 14,right: 14,top: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: providereTrue!.videolist.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.all(10),
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 5,
                            blurStyle: BlurStyle.solid),
                      ],
                    ),
                    child: InkWell(
                      onTap: (){
                        providereFalse!.h1 =providereTrue!.videolist[index];
                        Navigator.pushNamed(context, 'reel');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image(
                              fit: BoxFit.fill,
                              height: double.infinity,
                              width: double.infinity,
                              image: AssetImage(
                                '${providereTrue!.videolist[index].image}',
                              ),
                            ),
                            Container(
                              height: 35,
                              color: Colors.black54,
                              alignment: Alignment.center,
                              width: double.infinity,
                              child: Text(
                                "${providereTrue!.videolist[index].name}",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
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
