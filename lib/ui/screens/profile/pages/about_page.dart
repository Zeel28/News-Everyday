import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../theme/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            ),
          ),
          centerTitle: true,
          title: const Text("About App",
              style: TextStyle(color: primaryColor, letterSpacing: 1)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const[
                SizedBox(height: 8,),
                Text(
                  "Flutter is a popular framework for mobile app development that allows developers to create high-performance, cross-platform apps. In this project, you can create a news app in Flutter that displays the latest news stories from various sources.To get started, you'll need to use an API that provides news data. There are several APIs available, such as the NewsAPI, that you can use to fetch the latest news stories. Once you have an API key, you can use the http package in Flutter to make requests to the API and retrieve the news data.The app can have multiple screens, such as a home screen that displays the top headlines, a category screen that allows users to filter news by topic, and a detail screen that shows the full article.In the home screen, you can display the latest news articles as a list or a grid with images, titles, and brief descriptions. Tapping on an article takes the user to the detail screen where they can read the full article. You can also include options for the user to share the article or save it for later.In the category screen, you can allow the user to select a category, such as sports, politics, entertainment, or technology, and display the news articles related to that category.To improve the user experience, you can include features such as search, notifications, and bookmarks. With search, the user can search for articles using keywords or phrases. Notifications can be used to send alerts to the user when new articles are published. Bookmarks allow the user to save articles they find interesting for later reading.You can also incorporate features like dark mode, accessibility settings, and localization to make the app more user-friendly and accessible.Overall, a news app in Flutter can be a great project for a college assignment, allowing you to showcase your skills in mobile app development and user interface design.",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ));
  }
}
