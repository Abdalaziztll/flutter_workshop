// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskRequestModel {
  String taskDescription;
  String taskStatus;
  int project_id;
  TaskRequestModel({
    required this.taskDescription,
    required this.taskStatus,
    required this.project_id,
  });

  TaskRequestModel copyWith({
    String? taskDescription,
    String? taskStatus,
    int? project_id,
  }) {
    return TaskRequestModel(
      taskDescription: taskDescription ?? this.taskDescription,
      taskStatus: taskStatus ?? this.taskStatus,
      project_id: project_id ?? this.project_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taskDescription': taskDescription,
      'taskStatus': taskStatus,
      'project_id': project_id,
    };
  }

  factory TaskRequestModel.fromMap(Map<String, dynamic> map) {
    return TaskRequestModel(
      taskDescription: map['taskDescription'] as String,
      taskStatus: map['taskStatus'] as String,
      project_id: map['project_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskRequestModel.fromJson(String source) => TaskRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TaskRequestModel(taskDescription: $taskDescription, taskStatus: $taskStatus, project_id: $project_id)';

  @override
  bool operator ==(covariant TaskRequestModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.taskDescription == taskDescription &&
      other.taskStatus == taskStatus &&
      other.project_id == project_id;
  }

  @override
  int get hashCode => taskDescription.hashCode ^ taskStatus.hashCode ^ project_id.hashCode;
}
