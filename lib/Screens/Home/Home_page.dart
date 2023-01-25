import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import '../../theme/colors.dart';
import '../Favorite/Favorite_page.dart';
import '../Profile/Profile_page.dart';
import '../../api/Views/home.dart';
import '../discover_screen.dart';
import '../home_screen.dart';

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
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(18, 0, 18, 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryColor,
        ),
        child: GNav(
          backgroundColor: primaryColor,
          color: primaryLightColor,
          activeColor: primaryColor,
          gap: 8,
          padding: const EdgeInsets.all(10),
          tabBackgroundColor: primaryLightColor,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.search,
              text: "Search",
            ),
            GButton(
              icon: Icons.search,
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
