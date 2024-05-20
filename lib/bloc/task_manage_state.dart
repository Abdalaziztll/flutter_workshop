// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_manage_bloc.dart';

@immutable
sealed class TaskManageState {}

final class TaskManageInitial extends TaskManageState {}

class NewTextFieldCreated extends TaskManageState {
  List<TaskRequestModel> tasks;
  NewTextFieldCreated({
    required this.tasks,
  });
}

class AllTaskSended extends TaskManageState {}

class OneTaskSubmitd extends TaskManageState {}


