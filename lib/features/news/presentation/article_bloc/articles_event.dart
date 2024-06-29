part of 'articles_bloc.dart';

@immutable
sealed class ArticlesEvent {}

class GetAllArticles extends ArticlesEvent {}
