import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../theme/colors.dart';
import '../Welcome/welcome_screen.dart';
import 'components/intro_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // controller to keep track of which page we're on
  final PageController _controller = PageController();

  //keep track if we are on the last page or not
  bool onLastPage = false;
  final List<Widget> _list = <Widget>[
    IntroPage(
        bgColor: Colors.blue[50],
        mainTextColor: primaryColor,
        detectionTextColor: primaryColor,
        mainText: "Breaking news updates",
        assetImage: const AssetImage("assets/images/breaking_news.gif"),
        detectionText:
            "Stay Ahead of the Game with Our Breaking News Coverage. Get the latest breaking news and stay up-to-date with the most important events happening around the world, delivered straight to your phone."),
    IntroPage(
        bgColor: Colors.green[300],
        mainText: "Tailored news feed",
        mainTextColor: Colors.white,
    detectionTextColor: Colors.white,
        assetImage: const AssetImage("assets/images/articles_scrolling.gif"),
        detectionText:
            "Enjoy a personalized news feed that is tailored to your interests and preferences, so you can stay informed about the topics that matter most to you.",
    ),
    IntroPage(
        bgColor: Colors.grey[100],
        mainTextColor: primaryColor,
        detectionTextColor: primaryColor,
        mainText: "Stay informed daily",
        assetImage: const AssetImage("assets/images/informed_daily.gif"),
        detectionText:
            "Stay ahead of the game with daily news updates and analysis from top journalists and experts in your preferred areas of interest."),
    IntroPage(
        bgColor: Colors.purple[50],
        mainTextColor: primaryColor,
        detectionTextColor: primaryColor,
        mainText: "Curated news stories",
        assetImage: const AssetImage("assets/images/news_strories.jpg"),
        detectionText:
            "Discover a wide range of thought-provoking news stories that have been carefully curated and presented to you in a visually engaging format."),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                onLastPage = (value == 3);
              });
            },
            children: _list,
          ),
          Container(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    _controller.jumpToPage(3);
                  },
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(13),
                  child: const Icon(Icons.skip_next_sharp,
                      color: primaryColor, size: 30),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: const WormEffect(
                    activeDotColor: primaryColor,
                    dotColor: primaryColor,
                    paintStyle: PaintingStyle.stroke,
                  ),
                ),
                if (onLastPage)
                  MaterialButton(
                    onPressed: () {
                      Get.to(() => const WelcomeScreen());
                    },
                    color: primaryLightColor,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(15),
                    child: const Text("Get Started",
                        style: TextStyle(color: primaryColor)),
                  )
                else
                  MaterialButton(
                    onPressed: () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    color: primaryColor,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(15),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: primaryLightColor,
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
