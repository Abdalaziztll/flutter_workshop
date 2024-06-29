import 'package:clean_arch/core/error/failures.dart';
import 'package:clean_arch/features/news/domain/entity/article_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ArticleRepo {
  Future<Either<Failures, List<ArticleEntity>>> getAllArticels();
}
