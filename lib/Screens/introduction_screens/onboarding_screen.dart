import 'package:flutter/material.dart';
import 'package:news_everyday/Screens/Welcome/welcome_screen.dart';
import 'package:news_everyday/theme/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
        mainText: "Media Engagement",
        assetImage: const AssetImage("assets/images/media_engagement.gif"),
        detectionText:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and "),
    IntroPage(
        bgColor: Colors.green[300],
        mainText: "Article",
        mainTextColor: Colors.white,
    detectionTextColor: Colors.white,
        assetImage: const AssetImage("assets/images/articles_scrolling.gif"),
        detectionText:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and ",
    ),
    IntroPage(
        bgColor: Colors.grey[100],
        mainTextColor: primaryColor,
        detectionTextColor: primaryColor,
        mainText: "Breaking news",
        assetImage: const AssetImage("assets/images/breaking_news.gif"),
        detectionText:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and "),
    IntroPage(
        bgColor: Colors.purple[50],
        mainTextColor: primaryColor,
        detectionTextColor: primaryColor,
        mainText: "Global News",
        assetImage: const AssetImage("assets/images/global_news.gif"),
        detectionText:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and "),
  ];
  int _curr = 0;

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
                _curr = value;
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
