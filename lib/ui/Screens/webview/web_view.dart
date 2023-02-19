import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_everyday/utils/message.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../theme/colors.dart';
class WebViewApp extends StatefulWidget {

  final String url;

  WebViewApp({super.key, required this.url});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;



  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

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
            )),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined,color: primaryColor,),
            onPressed: () {
              controller.reload();
            },
          ),
        ],
      ),
      body: WebViewStack(controller: controller),       // MODIFY
    );
  }
}
class WebViewStack extends StatefulWidget {
  const WebViewStack({required this.controller, super.key});

  final WebViewController controller;

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    widget.controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
        onNavigationRequest: (navigation) {
          final host = Uri.parse(navigation.url).host;
          if (host.contains('youtube.com')) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Blocking navigation to $host',
                ),
              ),
            );
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(
          controller: widget.controller,
        ),
        if (loadingPercentage < 100)
          _isLoading ? MessageDialog().progressIndicator2(context) : Container(),
          // LinearProgressIndicator(
          //   value: loadingPercentage / 100.0,
          // ),
      ],
    );
  }
}
