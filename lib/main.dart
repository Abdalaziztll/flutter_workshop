import 'package:clean_arch/core/network/network_connection.dart';
import 'package:clean_arch/features/news/data/datasource/local/local_article_data_source.dart';
import 'package:clean_arch/features/news/data/datasource/remote/remote_article_data_source.dart';
import 'package:clean_arch/features/news/data/repository/article_repository_impl.dart';
import 'package:clean_arch/features/news/domain/usecase/get_all_articles_use_case.dart';
import 'package:clean_arch/features/news/presentation/article_bloc/articles_bloc.dart';
import 'package:clean_arch/features/news/presentation/view/news_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ArticlesBloc(
          GetAllArticelsUseCase(
            articleRepo: ArticleRepoImpl(
              remoteArticleDataSource: RemoteArticleDataSource(
                dio: Dio(),
              ),
              localArticleDataSource: LocalArticleDataSource(
                sharedPreferences: sharedPreferences,
              ),
              networkConnection: NetworkConnection(
                internetConnectionChecker: InternetConnectionChecker(),
              ),
            ),
          ),
        )..add(
            GetAllArticles(),
          ),
        child: const NewsView(),
      ),
    );
  }
}
