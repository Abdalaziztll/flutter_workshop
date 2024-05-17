// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clean_serive_layer/core/model/error_handler/base_model.dart';

class ProjectResponseModel extends ResutlModel{
  String name;
  String description;
  String status;
  ProjectResponseModel({
    required this.name,
    required this.description,
    required this.status,
  });

  ProjectResponseModel copyWith({
    String? name,
    String? description,
    String? status,
  }) {
    return ProjectResponseModel(
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'status': status,
    };
  }

  factory ProjectResponseModel.fromMap(Map<String, dynamic> map) {
    return ProjectResponseModel(
      name: map['name'] as String,
      description: map['description'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectResponseModel.fromJson(String source) => ProjectResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProjectResponseModel(name: $name, description: $description, status: $status)';

  @override
  bool operator ==(covariant ProjectResponseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.description == description &&
      other.status == status;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ status.hashCode;
}
