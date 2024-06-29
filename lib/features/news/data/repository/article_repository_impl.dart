// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_arch/features/news/data/model/article_model.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_arch/core/constants.dart';
import 'package:clean_arch/core/error/exceptions.dart';
import 'package:clean_arch/core/error/failures.dart';
import 'package:clean_arch/core/network/network_connection.dart';
import 'package:clean_arch/core/resources/app_url.dart';
import 'package:clean_arch/features/news/data/datasource/local/local_article_data_source.dart';
import 'package:clean_arch/features/news/data/datasource/remote/remote_article_data_source.dart';
import 'package:clean_arch/features/news/domain/entity/article_entity.dart';
import 'package:clean_arch/features/news/domain/repository/article_repository.dart';

class ArticleRepoImpl implements ArticleRepo {
  RemoteArticleDataSource remoteArticleDataSource;
  LocalArticleDataSource localArticleDataSource;
  NetworkConnection networkConnection;
  ArticleRepoImpl({
    required this.remoteArticleDataSource,
    required this.localArticleDataSource,
    required this.networkConnection,
  });

  @override
  Future<Either<Failures, List<ArticleEntity>>> getAllArticels() async {
    print('==========================================================');
    print(await networkConnection.isConnected);
    if (await networkConnection.isConnected) {
      try {
        List<ArticleModel> articles =
            await remoteArticleDataSource.getAllArticles(
          Constants.apiKey,
          Constants.country,
          AppUrl.endPoint,
        );
        localArticleDataSource.cacheArticles(articles);
        return Right(articles);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        List<ArticleModel> articles =
            await localArticleDataSource.getArticles();
        return Right(articles);
      } on EmptyCacheException {
        return Left(
          EmptyCacheFailure(),
        );
      }
    }
  }
}
