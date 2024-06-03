import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_application/models/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=1a93a4e40be2427ea942c506a3e1a571";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      List<dynamic> articles = jsonData["articles"];
      for (var article in articles) {
        if (article['urlToImage'] != null && article['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: article['title'],
            author: article['author'],
            description: article['description'],
            url: article['url'],
            urlToImage: article['urlToImage'],
            content: article["content"],
          );
          news.add(articleModel);
        }
      }
    }
  }
}
