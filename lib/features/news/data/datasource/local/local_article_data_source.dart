import 'dart:convert';

import 'package:clean_arch/core/constants.dart';
import 'package:clean_arch/core/error/exceptions.dart';
import 'package:clean_arch/features/news/data/model/article_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalArticleDataSource {
  final SharedPreferences sharedPreferences;

  LocalArticleDataSource({required this.sharedPreferences});
  Future<void> cacheArticles(List<ArticleModel> articles) async {
    List<Map<String, dynamic>> artilcesMap =
        List.generate(articles.length, (index) => articles[index].toMap());
    sharedPreferences.setString(
      Constants.cachedKey,
      json.encode(artilcesMap),
    );
  }

  Future<List<ArticleModel>> getArticles() async {
    String? jsonData = sharedPreferences.getString(Constants.cachedKey);
    if (jsonData != null) {
      List<dynamic> jsonToMap = json.decode(jsonData);
      List<ArticleModel> cachedArticles = List.generate(
        jsonToMap.length,
        (index) => ArticleModel.fromMap(
          jsonToMap[index],
        ),
      );
      return cachedArticles;
    } else {
      throw EmptyCacheException();
    }
  }
}
