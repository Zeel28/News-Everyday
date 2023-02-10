import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
class IpInfoApi{
  static Future<String?> getIpAddress() async{
    try{
      Response response = await http.get(Uri.parse("https://api.ipify.org/"));
      return response.statusCode == 200 ? response.body : null;
    }catch(e){
      return null;
    }
  }
}