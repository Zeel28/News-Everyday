import 'package:flutter/material.dart';

import '../detail_view.dart';

class NewsContainer extends StatelessWidget {
  String imageUrl;
  String newsHeand;
  String newsDec;
  String newsUrl;
  String newsCnt;

  NewsContainer(
      {Key? key,
        required this.imageUrl,
        required this.newsHeand,
        required this.newsDec,
        required this.newsCnt,
        required this.newsUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
              height: 300,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              placeholder: "assets/images/splashscreen.gif",
              image: imageUrl),
          SizedBox(
            height: 10,
          ),
          Text(
              newsHeand.length > 90
                  ? "${newsHeand.substring(0, 90)}..."
                  : newsHeand,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
          Text(newsDec, style: TextStyle(fontSize: 12, color: Colors.black38)),
          Text(
            newsCnt != "--"
                ? newsCnt.length > 250
                ? newsCnt.substring(0, 250)
                : "${newsCnt.toString().substring(0, newsCnt.length - 15)}..."
                : newsCnt,
            style: TextStyle(fontSize: 16),
          ),
          // const Spacer(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20),
          //       child: ElevatedButton(
          //           onPressed: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) =>
          //                         DetailViewScreen(newsUrl: newsUrl)));
          //           },
          //           child: Text("Read More")),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
