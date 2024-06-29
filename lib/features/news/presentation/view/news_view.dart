import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../article_bloc/articles_bloc.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          if (state is Success) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.articles[index].title ??
                      'null title value (API ISSUE)'),
                  subtitle: Text(state.articles[index].description ??
                      'null description value (API ISSUE)'),
                  // ! image url problem (API ISSUE) you can run the code bellow to see the exception
                  // leading: Image.network(state.articles[index].urlToImage ??
                  //     "https://d38b044pevnwc9.cloudfront.net/cutout-nuxt/enhancer/2.jpg"),
                  leading: Image.asset(
                      'assets/images/test.jpg'),
                );
              },
            );
          } else if (state is FailureState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
