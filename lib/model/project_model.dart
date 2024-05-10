// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProjecModel {
  num id;
  String name;
  String status;
  String description;
  ProjecModel({
    required this.id,
    required this.name,
    required this.status,
    required this.description,
  });

  ProjecModel copyWith({
    num? id,
    String? name,
    String? status,
    String? description,
  }) {
    return ProjecModel(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'status': status,
      'description': description,
    };
  }

  factory ProjecModel.fromMap(Map<String, dynamic> map) {
    return ProjecModel(
      id: map['id'] as num,
      name: map['name'] as String,
      status: map['status'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjecModel.fromJson(String source) => ProjecModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProjecModel(id: $id, name: $name, status: $status, description: $description)';
  }

  @override
  bool operator ==(covariant ProjecModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.status == status &&
      other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      status.hashCode ^
      description.hashCode;
  }
}
