
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  ImageContainer(
      {Key? key,
      this.height = 125,
      this.boarderRadius = 20,
      required this.width,
      required this.imageUrl,
      this.padding,
      this.margin,
      this.imageUrl2,
      this.child})
      : super(key: key);

  final double width;
  final double height;
  final String imageUrl;
  final String? imageUrl2;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double boarderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // return CachedNetworkImage(
    //   imageUrl: imageUrl,
    //   width: width,
    //   height: height,
    //   progressIndicatorBuilder: (context, url, downloadProgress) =>
    //       CircularProgressIndicator(value: downloadProgress.progress),
    //   errorWidget: (context, url, error) => Icon(Icons.error),
    // );
    return Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      );
  }
}
