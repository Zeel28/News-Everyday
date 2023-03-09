import 'package:flutter/material.dart';
import 'package:news_everyday/ui/theme/colors.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../controller/favourites_controller.dart';
import '../../../../../utils/message.dart';
import '../../../../model/article_model.dart';
import '../../webview/web_view.dart';

class MyFloatingActionButton extends StatefulWidget {
  Articles article;

  MyFloatingActionButton({Key? key, required this.article}) : super(key: key);

  @override
  _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  late Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  final FavoriteNewsService _favoriteNewsService =
      Get.put(FavoriteNewsService());

  @override
  Widget build(BuildContext context) {
    RxBool pressedBool = false.obs;
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 10,
            bottom: 10,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                IgnorePointer(
                  child: Container(
                    color: Colors.transparent,
                    height: 150.0,
                    width: 150.0,
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(270),
                      degOneTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degOneTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.blue,
                      width: 50,
                      height: 50,
                      icon: Icon(
                        Icons.share_outlined,
                        color: Colors.white,
                      ),
                      onClick: () async {
                        await Share.share(
                            'I saw this on the News Everyday and thought you should see it :-  ${widget.article.title}   ${widget.article.description}\n\n\n\n'
                            '* Disclaimer *  The News Everyday is not responsible for the content of this email, and anything written in this email does not necessarily reflect the News Everyday views or opinions. Please note that neither the email address nor name of the sender have been verified.',
                            subject:
                                'I saw this on the News Everyday and thought you should see it: ${widget.article.title}');
                      },
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(225),
                      degTwoTranslationAnimation.value * 100),
                  child: Transform(
                    transform: Matrix4.rotationZ(
                        getRadiansFromDegree(rotationAnimation.value))
                      ..scale(degTwoTranslationAnimation.value),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.black,
                      width: 50,
                      height: 50,
                      icon: Icon(
                        Icons.open_in_new,
                        color: Colors.white,
                      ),
                      onClick: () {
                        Get.to(() => WebViewApp(url: widget.article.url));
                      },
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset.fromDirection(getRadiansFromDegree(180),
                      degThreeTranslationAnimation.value * 100),
                  child: Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation.value))
                        ..scale(degThreeTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          pressedBool.toggle();
                          if (pressedBool.isTrue) {
                            _favoriteNewsService
                                .addFavoriteNews(widget.article);
                            MessageDialog().snackBarGetCut("Your News is saved",
                                "when you're ready to read this saved News, just tap on Saved News in the Menu bar",
                                backgroundColor: Colors.green);
                          } else {
                            _favoriteNewsService
                                .removeFavoriteNews(widget.article);
                            MessageDialog().snackBarGetCut(
                              "Remove News",
                              "",
                            );
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: primaryLightColor, shape: BoxShape.circle),
                          width: 60,
                          height: 60,
                          child: Obx(() {
                            return pressedBool.isTrue
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.redAccent,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                    color: primaryColor,
                                  );
                          }),
                        ),
                      )),
                ),
                Transform(
                  transform: Matrix4.rotationZ(
                      getRadiansFromDegree(rotationAnimation.value)),
                  alignment: Alignment.center,
                  child: CircularButton(
                    color: primaryColor,
                    width: 60,
                    height: 60,
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onClick: () {
                      if (animationController.isCompleted) {
                        animationController.reverse();
                      } else {
                        animationController.forward();
                      }
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function? onClick;

  CircularButton(
      {required this.color,
      required this.width,
      required this.height,
      required this.icon,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick as void Function()?,
      child: Container(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          width: width,
          height: height,
          child: icon),
    );
  }
}
