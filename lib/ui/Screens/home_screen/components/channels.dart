import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../details_page/category_screen.dart';

class Channels extends StatefulWidget {
   Channels({Key? key}) : super(key: key);

  @override
  State<Channels> createState() => _ChannelsState();
}

class _ChannelsState extends State<Channels> {
  List channel = [
    "Wall Street Journal",
    "BBC",
    "NDTV",
    "Yahoo",
    "News18",
    "India Today",
    "CNBC",
    "Indiatv",
    "ABP News",
    "TV9 Hindi",
    "Digitimes",
  ];
  List channelUrlData = [
    "wsj.com",
    "bbc.com",
    "ndtv.com",
    "yahoo.com",
    "news18.com",
    "indiatoday.in",
    "cnbc.com",
    "indiatvnews.com",
    "abplive.com",
    "tv9hindi.com",
    "Digitimes",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Channels',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            children: List.generate(
              10,
                  (index) {
                return InkWell(
                  onTap: () => Get.to(() => CategoryScreen(title: channel[index], keySearch: "domains", searchValue: channelUrlData[index],)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/channel_$index.png",
                            height: 90.0,
                            width: 90.0,
                          ),
                          // child: CachedNetworkImage(
                          //   fit: BoxFit.cover,
                          //   imageUrl: "assets/images/channel_$index",
                          //   width: 90.0,
                          //   height: 90.0,
                          // ),
                        ),
                      ),
                      Text("${channel[index]}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                      SizedBox(height: 12,)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
