class ArticleModel {
  List<dynamic> articals;
  ArticleModel({required this.articals});
  factory ArticleModel.fromJson(Map<String, dynamic> jsonData) {
    return ArticleModel(articals: jsonData['articles']);
  }
}
