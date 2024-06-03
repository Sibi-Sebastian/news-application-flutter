import 'package:firebase_application/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_application/models/article_model.dart';
import 'package:firebase_application/pages/article_view.dart';
import 'package:firebase_application/pages/liked_articles.dart';
import 'package:provider/provider.dart';

class LikedArticlesPage extends StatelessWidget {
  const LikedArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liked Articles',
          style: TextStyle(color: Colors.orange),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home()));
          },
        ),
      ),
      body: Consumer<LikedArticles>(
        builder: (context, likedArticles, child) {
          List<ArticleModel> articles = likedArticles.likedArticles;
          return Container(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                ArticleModel article = articles[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ArticleView(blogUrl: article.url ?? ''),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            article.urlToImage ?? '',
                            height: 200.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          article.title ?? '',
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(article.description ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            )),
                        const SizedBox(height: 5.0),
                        Consumer<LikedArticles>(
                          builder: (context, likedArticles, child) {
                            bool isLiked = likedArticles.isLiked(article);
                            return IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: isLiked ? Colors.red : null,
                              ),
                              onPressed: () {
                                if (isLiked) {
                                  likedArticles.removeArticle(article);
                                } else {
                                  likedArticles.addArticle(article);
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
