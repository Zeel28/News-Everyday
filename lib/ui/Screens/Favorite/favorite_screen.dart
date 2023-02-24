import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FavoriteScreen"),
      ),
      body: const Center(),
    );
  }
}

class IpInfoApi {
  static Future<String?> getIpAddress() async {
    try {
      Response response = await http.get(Uri.parse("https://api.ipify.org/"));
      return response.statusCode == 200 ? response.body : null;
    } catch (e) {
      return null;
    }
  }
}