// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:slim_voice/backend/enum/enum.currency.dart';
import 'package:slim_voice/backend/enum/enum.dueDate.dart';
import 'package:slim_voice/backend/enum/enum.negativeSign.dart';

class ProfileModel {
  String id;
  String name;
  String address;
  Currency currency;
  DueDate defaultDueDate;
  NegativeSign sign;
  String get getId => id.replaceAll("profile:", '');
  ProfileModel({
    required this.id,
    required this.name,
    required this.address,
    required this.currency,
    required this.defaultDueDate,
    required this.sign,
  });

  ProfileModel copyWith({
    String? id,
    String? name,
    String? address,
    Currency? currency,
    DueDate? defaultDueDate,
    NegativeSign? sign,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      currency: currency ?? this.currency,
      defaultDueDate: defaultDueDate ?? this.defaultDueDate,
      sign: sign ?? this.sign,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'currency': currency.index,
      'defaultDueDate': defaultDueDate.index,
      'sign': sign.index,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      currency: Currency.values[map['currency'] as int],
      defaultDueDate: DueDate.values[map['defaultDueDate'] as int],
      sign: NegativeSign.values[map['sign'] as int],
    );
  }

  factory ProfileModel.empty() {
    return ProfileModel(
        id: "",
        name: "",
        address: "",
        currency: Currency.JMD,
        defaultDueDate: DueDate.Immediately,
        sign: NegativeSign.Parenthesis);
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileModel(id: $id, name: $name, address: $address, currency: $currency, defaultDueDate: $defaultDueDate, sign: $sign)';
  }

  @override
  bool operator ==(covariant ProfileModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.address == address &&
        other.currency == currency &&
        other.defaultDueDate == defaultDueDate &&
        other.sign == sign;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        address.hashCode ^
        currency.hashCode ^
        defaultDueDate.hashCode ^
        sign.hashCode;
  }
}
