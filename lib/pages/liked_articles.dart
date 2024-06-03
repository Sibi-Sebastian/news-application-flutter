import 'package:flutter/material.dart';
import 'package:firebase_application/models/article_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikedArticles with ChangeNotifier {
  final List<ArticleModel> _likedArticles = [];

  List<ArticleModel> get likedArticles => _likedArticles;

  get articles => null;

  void addArticle(ArticleModel article) async {
    if (!_likedArticles.contains(article)) {
      _likedArticles.add(article);
      notifyListeners();
      await _saveLikedArticles();
    }
  }

  void removeArticle(ArticleModel article) async {
    if (_likedArticles.contains(article)) {
      _likedArticles.remove(article);
      notifyListeners();
      await _saveLikedArticles();
    }
  }

  bool isLiked(ArticleModel article) {
    return _likedArticles.contains(article);
  }

  Future<void> _saveLikedArticles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> likedArticleUrls =
        _likedArticles.map((article) => article.url ?? "").toList();
    await prefs.setStringList('likedArticles', likedArticleUrls);
  }

  Future<void> loadLikedArticles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? likedArticleUrls = prefs.getStringList('likedArticles');
    if (likedArticleUrls != null) {
      _likedArticles.clear();
      likedArticleUrls.forEach((url) {
        ArticleModel? article = articles.firstWhere(
          (article) => article.url == url,
          orElse: () => null,
        );
        if (article != null) {
          _likedArticles.add(article);
        }
      });
      notifyListeners();
    }
  }
}
