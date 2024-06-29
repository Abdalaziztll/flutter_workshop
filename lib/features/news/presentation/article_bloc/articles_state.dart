part of 'articles_bloc.dart';

@immutable
sealed class ArticlesState {}

final class ArticlesInitial extends ArticlesState {}

class Success extends ArticlesState {
  final List<ArticleEntity> articles;

  Success({required this.articles});
}

class Loading extends ArticlesState {}

class FailureState extends ArticlesState {
  final String message;

  FailureState({required this.message});
}
