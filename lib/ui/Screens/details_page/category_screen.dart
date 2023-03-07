import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/article_model.dart';
import '../../../services/api_service.dart';
import '../../../utils/message.dart';
import '../../theme/colors.dart';
import '../../widgets/list_title/vertical_list_title.dart';

class CategoryScreen extends StatefulWidget {
  String title;

  CategoryScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Articles> categoryArticles = [];
  bool _isLoading = true;
  late String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadNews(widget.title);
  }
  Future<void> _loadNews(String category) async {
  final queryParameters = {
    'q' : category,
    'sortBy': "relevancy",
    'sortBy': 'popularity',
    'language': 'en',
    'apiKey': '459f208e91ae40e3a7f6477321f9e61e',
  };
    try {
      final article = await ApiService.searchNews(queryParameters);
      setState(() {
        categoryArticles = article;
        _isLoading = false;
        _errorMessage = null;
      });
    } catch (e) {
      setState(() {
        categoryArticles = [];
        _isLoading = false;
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            )),
        centerTitle: true,
        title: Text(widget.title,
            style: TextStyle(color: primaryColor, letterSpacing: 1)),
      ),
      body: _isLoading
          ? Center(child: MessageDialog().progressIndicator(context))
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: categoryArticles.length,
                  itemBuilder: (context, index) {
                    return VListTitle(demo: categoryArticles[index]);
                  },
                ),
    );
  }
}
