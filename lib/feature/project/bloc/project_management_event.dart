part of 'project_management_bloc.dart';

@immutable
sealed class ProjectManagementEvent {}


class GetAllProject extends ProjectManagementEvent {}