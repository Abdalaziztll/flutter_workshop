import 'package:bloc/bloc.dart';
import 'package:clean_serive_layer/core/model/request/taskreqmodel.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'task_manage_event.dart';
part 'task_manage_state.dart';

class TaskManageBloc extends Bloc<TaskManageEvent, TaskManageState> {
  TaskManageBloc() : super(TaskManageInitial()) {
    List<TaskRequestModel> tasks = [];
    // ? to add new text feild
    // ! remember that you can get better solution with your skill
    on<CreateNewTextFiel>((event, emit) {
      tasks.add(
          TaskRequestModel(taskDescription: '', taskStatus: '', project_id: 1));
      emit(NewTextFieldCreated(tasks: tasks));
    });

    // ? to edit prev fake model that we created it to increase list length
    on<SubmitOneTask>((event, emit) {
      tasks.last = event.oneTask;
      emit(OneTaskSubmitd());
      emit(NewTextFieldCreated(tasks: tasks));
      print(tasks);
    });
    // ? this event for send all task to the service layer
    on<SendAllTask>((event, emit) async {
      List<Map> req = [];
      tasks.forEach((element) {
        req.add(element.toMap());
      });
      Response response = await Dio().post("path", data: req);
    });
  }
}
