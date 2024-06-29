import 'package:bloc/bloc.dart';
import 'package:clean_arch/core/error/failures.dart';
import 'package:clean_arch/features/news/domain/entity/article_entity.dart';
import 'package:clean_arch/features/news/domain/usecase/get_all_articles_use_case.dart';
import 'package:meta/meta.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final GetAllArticelsUseCase getAllArticelsUseCase;
  ArticlesBloc(this.getAllArticelsUseCase) : super(ArticlesInitial()) {
    on<GetAllArticles>((event, emit) async {
      emit(Loading());
      final failureOrEntity = await getAllArticelsUseCase.call();

      failureOrEntity.fold((failure) {
        String message = '';
        switch (failure.runtimeType) {
          case ServerFailure:
            message = 'Please try again later.. ';
            break;
          case EmptyCacheFailure:
            message = 'there is no data';
            break;
          default:
            message = 'there is no internet';
            break;
        }
        emit(FailureState(message: message));
      }, (articles) {
        emit(
          Success(articles: articles),
        );
      });
    });
  }
}
