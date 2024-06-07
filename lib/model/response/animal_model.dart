// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mock_and_init_careem/model/handling.dart';

class AnimalModel extends ResultModel {
  String name;
  String image;
  String id;
  AnimalModel({
    required this.name,
    required this.image,
    required this.id,
  });

  AnimalModel copyWith({
    String? name,
    String? image,
    String? id,
  }) {
    return AnimalModel(
      name: name ?? this.name,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'id': id,
    };
  }

  factory AnimalModel.fromMap(Map<String, dynamic> map) {
    return AnimalModel(
      name: map['name'] as String,
      image: map['image'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalModel.fromJson(String source) => AnimalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AnimalModel(name: $name, image: $image, id: $id)';

  @override
  bool operator ==(covariant AnimalModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image &&
      other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode ^ id.hashCode;
}
