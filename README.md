# News Everyday 

This simple Flutter News Application uses GetX State Management for efficient state management. The application fetches news articles using [newsapi. org](https://newsapi.org/) and displays them in a list. Users can click on an article to view the full details of the article.

## Features
* Fetches news articles from [newsapi. org](https://newsapi.org/)
* Search for articles by keyword
* Display articles with images and clickable links
* Favorite news features and access any device way Firebase FireStore
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

To get started with this application, follow these steps:

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
* #state management
* get:
* #lottie Image
* lottie: ^2.2.0
* #Firebase
* firebase_auth: ^4.2.5
* firebase_core: ^2.4.1
* #firebase Storage
* firebase_storage: ^11.0.13
* #slider button
* slide_to_act: ^2.0.1
* #webview
* webview_flutter: ^4.0.2
* #Bottom Navbar
* google_nav_bar: ^5.0.6
* #API
* http: ^0.13.5
* #Cuntry Code Picker
* fl_country_code_picker: ^0.0.4
* #share
* share_plus: ^6.3.1
* #Google SignIn(Firebase)
* google_sign_in: ^5.4.3
* #firestore
* cloud_firestore: ^4.3.1
* #onboarding screen
* smooth_page_indicator: ^1.0.0+2
* #OTP text field
* flutter_otp_text_field: ^1.1.1
* #Fancy Pull to Refresh
* liquid_pull_to_refresh: ^3.0.1
* #open a mail app
* url_launcher: ^6.1.10
* #Slider
* carousel_slider: ^4.2.1
* #splash screen
* splash_screen_view:
* #Network Image
* cached_network_image: ^3.2.3
* #ListTitleSlidable
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