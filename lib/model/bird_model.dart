// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:deep_div/model/handling.dart';

class BirdModel extends ResultModel{
  String name;
  String family;
  String image;
  BirdModel({
    required this.name,
    required this.family,
    required this.image,
  });

  BirdModel copyWith({
    String? name,
    String? family,
    String? image,
  }) {
    return BirdModel(
      name: name ?? this.name,
      family: family ?? this.family,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'family': family,
      'image': image,
    };
  }

  factory BirdModel.fromMap(Map<String, dynamic> map) {
    return BirdModel(
      name: map['name'] as String,
      family: map['family'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BirdModel.fromJson(String source) => BirdModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BirdModel(name: $name, family: $family, image: $image)';

  @override
  bool operator ==(covariant BirdModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.family == family &&
      other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ family.hashCode ^ image.hashCode;
}
