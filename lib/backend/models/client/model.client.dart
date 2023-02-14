// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ClientModel {
  String id;
  String userId;
  String name;
  String address;
  List<String> contacts;
  ClientModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.address,
    required this.contacts,
  });

  ClientModel copyWith({
    String? id,
    String? userId,
    String? name,
    String? address,
    List<String>? contacts,
  }) {
    return ClientModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      address: address ?? this.address,
      contacts: contacts ?? this.contacts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'name': name,
      'address': address,
      'contacts': contacts,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'] as String,
      userId: map['userId'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      contacts: List.from((map['contacts'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClientModel(id: $id, userId: $userId, name: $name, address: $address, contacts: $contacts)';
  }

  @override
  bool operator ==(covariant ClientModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.name == name &&
        other.address == address &&
        listEquals(other.contacts, contacts);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        name.hashCode ^
        address.hashCode ^
        contacts.hashCode;
  }
}
