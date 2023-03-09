import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 2.0,
                  spreadRadius: 2.0,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage.assetNetwork(
                  height: 300,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: "assets/images/splashscreen.gif",
                  image: imageUrl),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
              newsHeand.length > 90
                  ? "${newsHeand.substring(0, 90)}..."
                  : newsHeand,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
          Text(newsDec, style: TextStyle(fontSize: 12, color: Colors.black38)),
          Text(
            // newsCnt != "--"
            //     ? newsCnt.length > 350
            //         ? newsCnt.substring(0, 250)
            //         : "${newsCnt.toString().substring(0, newsCnt.length - 15)}..."
            //     : newsCnt,
            newsCnt,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
