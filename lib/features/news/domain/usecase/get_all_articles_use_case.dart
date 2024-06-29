// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_arch/core/error/failures.dart';
import 'package:clean_arch/features/news/domain/entity/article_entity.dart';
import 'package:clean_arch/features/news/domain/repository/article_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllArticelsUseCase {
  ArticleRepo articleRepo;
  GetAllArticelsUseCase({
    required this.articleRepo,
  });

  Future<Either<Failures, List<ArticleEntity>>> call() async {
    return await articleRepo.getAllArticels();
  }
}
