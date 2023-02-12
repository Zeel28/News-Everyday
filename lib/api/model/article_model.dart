import 'package:equatable/equatable.dart';
import 'package:news_everyday/api/model/source_model.dart';


class Article extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final int view;
  final DateTime createdAt;

 const Article({
   required this.id,
   required this.title,
   required this.subtitle,
   required this.body,
   required this.author,
   required this.authorImageUrl,
   required this.category,
   required this.imageUrl,
   required this.view,
   required this.createdAt,
 });

 static List<Article> articles = [
   Article(
     id: '1',
     title: "t is a long established fact that a reader will be distracted by the",
     subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
     body: "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release ",
     author: "Anna G, Wright",
     authorImageUrl: "https://images.unsplash.com/photo-1674552977926-6409388bb450?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
     category: "Politics",
     view: 1204,
     imageUrl: "https://images.unsplash.com/photo-1674555650084-ae4c3dcfe79c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
     createdAt: DateTime.now().subtract(const Duration(hours: 5)),
   ),
   Article(
     id: '2',
     title: "t is a long established fact that a reader will be distracted by the ",
     subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
     body: "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release ",
     author: "Anna G, Wright",
     authorImageUrl: "https://images.unsplash.com/photo-1674552977926-6409388bb450?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
     category: "Politics",
     view: 1204,
     imageUrl: "https://images.unsplash.com/photo-1674555650084-ae4c3dcfe79c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
     createdAt: DateTime.now().subtract(const Duration(hours: 5)),
   ),
   Article(
     id: '3',
     title: "t is a long established fact that a reader will be distracted by the ",
     subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
     body: "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release ",
     author: "Anna G, Wright",
     authorImageUrl: "https://images.unsplash.com/photo-1674552977926-6409388bb450?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
     category: "Politics",
     view: 1204,
     imageUrl: "https://images.unsplash.com/photo-1674555650084-ae4c3dcfe79c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
     createdAt: DateTime.now().subtract(const Duration(hours: 5)),
   ),
   Article(
     id: '4',
     title: "t is a long established fact that a reader will be distracted by the ",
     subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ",
     body: "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release ",
     author: "Anna G, Wright",
     authorImageUrl: "https://images.unsplash.com/photo-1674552977926-6409388bb450?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
     category: "Politics",
     view: 1204,
     imageUrl: "https://images.unsplash.com/photo-1674555650084-ae4c3dcfe79c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
     createdAt: DateTime.now().subtract(const Duration(hours: 5)),
   ),

 ];
  @override
  List<Object> get props => [
    id,
    title,
    subtitle,
    body,
    author,
    authorImageUrl,
    category,
    imageUrl,
    createdAt
  ];
}


class Articles {
  final String title;
  final String description;
  final String urlToImage;
  final String url;
  final String publishedAt;
  final String content;

  Articles({required this.title, required this.description, required this.urlToImage, required this.url, required this.content, required this.publishedAt});

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      title: json['title']  ?? '',
      description: json['description']  ?? '',
      urlToImage: json['urlToImage']  ?? "https://static.vecteezy.com/system/resources/thumbnails/006/299/370/original/world-breaking-news-digital-earth-hud-rotating-globe-rotating-free-video.jpg",
      url: json['url']  ?? '',
      publishedAt: json['publishedAt']  ?? '',
      content: json['content']  ?? '',

    );
  }
}