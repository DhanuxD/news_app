import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/Models/artical_model.dart';
import 'package:news_app/Models/news_model.dart';
import 'package:news_app/constant/alert_dilog.dart';

class NewsApi {
  List<NewsModel> newsList = [];
  Future<List<NewsModel>> getNews({required context}) async {
    const apiUrl =
        "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=4e76508ae2b6414a838b71ba6187372a#";
    final url = Uri.parse(apiUrl);
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticleModel articalModel = ArticleModel.fromJson(jsonData);
        newsList =
            articalModel.articals.map((e) => NewsModel.fromJson(e)).toList();
      }
    } catch (e) {
      showAlertDilog(context, "Error : $e");
    }
    return newsList;
  }

  Future<List<NewsModel>> getSearchNews(
      {required context, required String query}) async {
    final apiUrl =
        "https://newsapi.org/v2/top-headlines?q=$query&apiKey=4e76508ae2b6414a838b71ba6187372a#";
    final url = Uri.parse(apiUrl);
    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticleModel articalModel = ArticleModel.fromJson(jsonData);
        newsList =
            articalModel.articals.map((e) => NewsModel.fromJson(e)).toList();
      }
    } catch (e) {
      showAlertDilog(context, "Error : $e");
    }
    return newsList;
  }
}
