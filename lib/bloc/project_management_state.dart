// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'project_management_bloc.dart';

@immutable
sealed class ProjectManagementState {}

final class ProjectManagementInitial extends ProjectManagementState {}

class SuccessFetchProject extends ProjectManagementState {
  List<ProjectResponseModel> listOfProject;
  SuccessFetchProject({
    required this.listOfProject,
  });
}

class ErrorState extends ProjectManagementState {
  String message;
  ErrorState({
    required this.message,
  });
}

class OfflineState extends ProjectManagementState {
  String Messge;
  OfflineState({
    required this.Messge,
  });
}

class LoadingState extends ProjectManagementState {}
