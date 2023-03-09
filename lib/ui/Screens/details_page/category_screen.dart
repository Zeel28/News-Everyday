import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/article_model.dart';
import '../../../services/api_service.dart';
import '../../../utils/message.dart';
import '../../theme/colors.dart';
import '../../widgets/list_title/vertical_list_title.dart';

class CategoryScreen extends StatefulWidget {
  String title;
  String searchValue;
  String keySearch;

  CategoryScreen(
      {Key? key,
      required this.title,
      required this.keySearch,
      required this.searchValue})
      : super(key: key);

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
    _loadNews(widget.searchValue, widget.keySearch);
  }

  Future<void> _loadNews(String category, String key) async {
    final queryParameters = {
      key: category,
      'sortBy': 'popularity',
      'language': 'en',
      'apiKey': '3f1a0e1381c74be2ab644cf747bfad83',
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
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: categoryArticles.length,
                  itemBuilder: (context, index) {
                    return VListTitle(demo: categoryArticles[index]);
                  },
                ),
    );
  }
}
