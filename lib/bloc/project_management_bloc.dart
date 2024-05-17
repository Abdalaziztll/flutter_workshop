import 'package:bloc/bloc.dart';
import 'package:clean_serive_layer/core/data/project_service/project_serivce.dart';
import 'package:clean_serive_layer/core/model/error_handler/base_model.dart';
import 'package:clean_serive_layer/core/model/reesponse/projrect_response_model.dart';
import 'package:meta/meta.dart';

part 'project_management_event.dart';
part 'project_management_state.dart';

class ProjectManagementBloc
    extends Bloc<ProjectManagementEvent, ProjectManagementState> {
  ProjectManagementBloc() : super(ProjectManagementInitial()) {
    on<GetAllProject>((event, emit) async {
      emit(LoadingState());
      ResutlModel result = await ProjectServiceImp().getProject();

      if (result is ListOf<ProjectResponseModel>) {
        emit(SuccessFetchProject(listOfProject: result.project));
      } else if (result is ErrorModel) {
        emit(ErrorState(message: result.message));
      } else {
        emit(OfflineState(Messge: (result as ExceptionModel).message));
      }
    });
  }
}
