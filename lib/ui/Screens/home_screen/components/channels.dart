import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
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
    // "TV9 Hindi",
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
    // "tv9hindi.com",
    "digitimes.com",
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
              const Text(
                'Channels',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () => Get.to(() =>  ChannelsScreen(channelList: channel,channelUrlData: channelUrlData)),
                child: Text(
                  "More",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            children: List.generate(
              6,
              (index) {
                return InkWell(
                  onTap: () => Get.to(() => CategoryScreen(
                        title: channel[index],
                        keySearch: "domains",
                        searchValue: channelUrlData[index],
                      )),
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
                        ),
                      ),
                      Text(
                        "${channel[index]}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 12,
                      )
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
class ChannelsScreen extends StatelessWidget {
  List channelList;
  List channelUrlData;
  ChannelsScreen({Key? key, required this.channelList, required this.channelUrlData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            )),
        centerTitle: true,
        title: const Text("Channel",
            style: TextStyle(color: primaryColor, letterSpacing: 1)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Wrap(
          children: List.generate(
            10,
                (index) {
              return InkWell(
                onTap: () => Get.to(() => CategoryScreen(
                  title: channelList[index],
                  keySearch: "domains",
                  searchValue: channelUrlData[index],
                )),
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
                      ),
                    ),
                    Text(
                      "${channelList[index]}",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 12,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
