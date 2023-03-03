import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'Discover/discover_screen.dart';
import 'Favorite/favorite_screen.dart';
import 'Profile/profile_page.dart';
import 'feed/Views/newsfeed.dart';
import 'home_screen/home_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static List<Widget> pages = <Widget>[
    HomeScreen(),
    DiscoverScreen(),
    NewsFeed(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: Center(
        child: pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryColor,
        ),
        child: GNav(
          backgroundColor: primaryColor,
          color: mainBackgroundColor,
          activeColor: primaryColor,
          gap: 2,
          padding: const EdgeInsets.all(10),
          tabBackgroundColor: mainBackgroundColor,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.search,
              text: "Discover",
            ),
            GButton(
              icon: Icons.splitscreen_sharp,
              text: "Feed",
            ),
            GButton(
              icon: Icons.favorite_outline_sharp,
              text: "Favorite",
            ),
            GButton(
              icon: Icons.person,
              text: "Profile",
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
