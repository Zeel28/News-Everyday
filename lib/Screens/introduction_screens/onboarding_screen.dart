import 'package:flutter/material.dart';
import 'package:news_everyday/Screens/Welcome/welcome_screen.dart';
import 'package:news_everyday/theme/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro_page_1.dart';
import 'intro_page_2.dart';
import 'intro_page_3.dart';

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
        mainText: "1",
        imgPath: "assets/lottiefile/Intro_media_engagement.json",
        detection:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
    IntroPage(
        mainText: "2",
        imgPath: "assets/lottiefile/Intro_media_engagement.json",
        detection:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
    IntroPage(
        mainText: "3",
        imgPath: "assets/lottiefile/Intro_media_engagement.json",
        detection:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
    ];
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: _list,
            scrollDirection: Axis.horizontal,
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                _curr = value;
                onLastPage = (value == 2);
              });
            },
          ),
          Container(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    _controller.jumpToPage(2);
                  },
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(13),
                  child: const Icon(Icons.skip_next_sharp,
                      color: primaryColor, size: 30),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                    activeDotColor: primaryColor,
                    dotColor: primaryColor,
                    paintStyle: PaintingStyle.stroke,
                  ),
                ),
                if (onLastPage)
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(),
                          ));
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
