import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_application/models/slider_model.dart';

class Sliders {
  List<sliderModel> sliders = [];

  Future<void> getSlider() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=1a93a4e40be2427ea942c506a3e1a571";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      List<dynamic> articles = jsonData["articles"];
      for (var article in articles) {
        if (article['urlToImage'] != null && article['description'] != null) {
          sliderModel slidermodel = sliderModel(
            title: article['title'],
            author: article['author'],
            description: article['description'],
            url: article['url'],
            urlToImage: article['urlToImage'],
            content: article["content"],
          );
          sliders.add(slidermodel);
        }
      }
    }
  }
}
