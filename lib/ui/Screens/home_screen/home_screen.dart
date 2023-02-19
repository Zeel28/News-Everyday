import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../theme/colors.dart';
import '../../widgets/custom_icon_button.dart';
import 'components/breakingnews.dart';
import 'components/header_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> _handleRefresh() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    ];

    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(100, 90), //width and height
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(radius: 35),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 2.0,
                          spreadRadius: 2.0,
                          offset: Offset(
                            5.0,
                            5.0,
                          ),
                        )
                      ],
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_active, color: primaryColor),))
              ],
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        color: primaryColor,
        height: 150,
        animSpeedFactor: 2,
        backgroundColor: primaryLightColor,
        showChildOpacityTransition: false,
        child: ListView(
          children: [
            HeaderSlider(imgList: imgList),
            BreakingNews(),
            BreakingNews(),
          ],
        ),
      ),
    );
  }
}
