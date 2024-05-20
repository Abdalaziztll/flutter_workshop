// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_manage_bloc.dart';

@immutable
sealed class TaskManageEvent {}

class CreateNewTextFiel extends TaskManageEvent {}

class SendAllTask extends TaskManageEvent {}

class SubmitOneTask extends TaskManageEvent {
  TaskRequestModel oneTask;
  SubmitOneTask({
    required this.oneTask,
  });
}
