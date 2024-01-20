import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/Models/artical_model.dart';
import 'package:news_app/Models/news_model.dart';
import 'package:news_app/constant/alert_dilog.dart';

// Using this prcoccesure if I have a list of maps in side the whole map (2 models)
class NewsApi {
  var apiUrl =
      "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=4e76508ae2b6414a838b71ba6187372a#";
  //var data = [];
  //List <Articles> articles = [];
  List<NewsModel> newsList = [];
/* Spicified the type of function to get the counstrutor*/ Future<
      List<NewsModel>> getNews({required context}) async {
    var url = Uri.parse(apiUrl);
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticleModel articalModel = ArticleModel.fromJson(jsonData);
        newsList =
            articalModel.articals.map((e) => NewsModel.fromJson(e)).toList();
        // if (query != null) {
        //   newsList = newsList
        //       .where((element) =>
        //           element.title.toLowerCase().contains(query.toLowerCase()))
        //       .toList();
        // }
        //     data = jsonDecode(response.body);
        // articles = data.map((e) => Articles.fromJson(e)).toList();
      }
    } catch (e) {
      showAlertDilog(context, "Error : $e");
    }
    // return articles
    return newsList;
  }
}
