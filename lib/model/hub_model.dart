// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HubModel {
  num id;
  String name;
  String description;
  num latitude;
  num longitude;
  HubModel({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
  });

  HubModel copyWith({
    num? id,
    String? name,
    String? description,
    num? latitude,
    num? longitude,
  }) {
    return HubModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory HubModel.fromMap(Map<String, dynamic> map) {
    return HubModel(
      id: map['id'] ?? -1,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      latitude: map['latitude'] ?? -1,
      longitude: map['longitude'] ?? -1,
    );
  }

  String toJson() => json.encode(toMap());

  factory HubModel.fromJson(String source) =>
      HubModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HubModel(id: $id, name: $name, description: $description, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant HubModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}

class HubModelWithNull {
  num? id;
  String? name;
  String? description;
  num? latitude;
  num? longitude;
  HubModelWithNull({
    this.id,
    this.name,
    this.description,
    this.latitude,
    this.longitude,
  });

  HubModelWithNull copyWith({
    num? id,
    String? name,
    String? description,
    num? latitude,
    num? longitude,
  }) {
    return HubModelWithNull(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory HubModelWithNull.fromMap(Map<String, dynamic> map) {
    return HubModelWithNull(
      id: map['id'] != null ? map['id'] as num : null,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      latitude: map['latitude'] != null ? map['latitude'] as num : null,
      longitude: map['longitude'] != null ? map['longitude'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HubModelWithNull.fromJson(String source) => HubModelWithNull.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HubModelWithNull(id: $id, name: $name, description: $description, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant HubModelWithNull other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.latitude == latitude &&
      other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      latitude.hashCode ^
      longitude.hashCode;
  }
}
