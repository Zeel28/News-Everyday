# News Everyday 

This simple Flutter News Application uses GetX State Management for efficient state management. The application fetches news articles using [newsapi. org](https://newsapi.org/) and displays them in a list. Users can click on an article to view the full details of the article.

<p align="center">
 <img width="800" alt="wonderous-banner-800w" src="screenshots\app_banner_news_everyday.png">
</p>

# Download App
<p align="left">
 <img width="150" alt="wonderous-banner-800w" src="screenshots\download.png">
</p>

## Features
* Fetches news articles from [newsapi. org](https://newsapi.org/)
* Search for articles by keyword
* Display articles with images and clickable links
* Favorite news features and access any device way Firebase FireStore
* My Feed – A feed of latest stories and other content personalised only for you!
* News-Everyday intelligently learns your preferences as you swipe, and displays stories personalized for you in ‘Feed’
* Share News : Facebook, WhatsApp, Reddit, Hike, e-mail and other social platforms are supported
* More news in WebView
* Authentication : 
  - Email Password (send email verification, forgot password, login, Signup)
  - Google Authentication
  - Phone number Authentication  (valid phone number check, send OTP, Right OTP )


## Technologies used
* Flutter 3.6
* Dart
* GetX state management 
* NewsAPI
* Firebase Authentication
* Firebase FireStore 

## Getting Started

To get started with this application, follow these steps :

1. Clone this repository:
```bash
git clone https://github.com/Zeel28/News-Everyday.git
```
2. Navigate to the cloned repository:
```bash
cd flutter-news-app
```
3. Install the required dependencies:
```bash
flutter pub get
```
4. Create an account on [newsapi.org](https://newsapi.org/) and generate an API key.
5. Run the application:
```bash
flutter run
```

## Dependencies
The following dependencies are used in the application:
* flutter_svg: ^1.1.0
* get:
* lottie: ^2.2.0
* firebase_auth: ^4.2.5
* firebase_core: ^2.4.1
* firebase_storage: ^11.0.13
* slide_to_act: ^2.0.1
* webview_flutter: ^4.0.2
* google_nav_bar: ^5.0.6
* http: ^0.13.5
* fl_country_code_picker: ^0.0.4
* share_plus: ^6.3.1
* google_sign_in: ^5.4.3
* cloud_firestore: ^4.3.1
* smooth_page_indicator: ^1.0.0+2
* flutter_otp_text_field: ^1.1.1
* liquid_pull_to_refresh: ^3.0.1
* url_launcher: ^6.1.10
* carousel_slider: ^4.2.1
* splash_screen_view:
* cached_network_image: ^3.2.3
* flutter_slidable: ^2.0.0

## Project structure
The project structure follows the GetX state management pattern, consisting of the following directories:
* `controllers`: This folder contains the GetX controllers used for state management.
* `models`: This folder contains the data models used in the application.
* `controllers`: This folder contains the GetX controllers used for state management.
* `services`: This folder contains the API service used to fetch news articles.
* `ui`: This folder contains the various components , screen, theme, widgets of the application.
* `utils`: This folder contains the constants used in the application.
* `splash.dart`: This is splash screen of the application.
* `main.dart`: This is the entry point of the application.

## Contributing

Contributions are welcome! If you have any suggestions or bug reports, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.