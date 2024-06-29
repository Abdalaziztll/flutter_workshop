// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_arch/core/constants.dart';
import 'package:clean_arch/core/error/exceptions.dart';
import 'package:clean_arch/core/resources/app_url.dart';
import 'package:clean_arch/features/news/data/model/article_model.dart';
import 'package:dio/dio.dart';

class RemoteArticleDataSource {
  Dio dio;
  RemoteArticleDataSource({
    required this.dio,
  });

  Future<List<ArticleModel>> getAllArticles(
      String apiKey, String country, String endPoint) async {
    Response response = await dio.get(
      '${AppUrl.baseUrl}/${AppUrl.endPoint}?country=${Constants.country}&category=${Constants.category}&apiKey=${Constants.apiKey}',
    );

    if (response.statusCode == 200) {
      print(response.data['articles']);
      List<ArticleModel> articles = List.generate(
        response.data['articles'].length,
        (index) => ArticleModel.fromMap(
          response.data['articles'][index],
        ),
      );
      return articles;
    } else {
      throw ServerException();
    }
  }
}
