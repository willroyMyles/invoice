// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class SentModel {
  DateTime sentDate;
  bool isDraft = true;
  List<SentRecipient> sentRecipients;
  SentModel({
    required this.sentDate,
    required this.isDraft,
    required this.sentRecipients,
  });

  SentModel copyWith({
    DateTime? sentDate,
    bool? isDraft,
    List<SentRecipient>? sentRecepients,
  }) {
    return SentModel(
      sentDate: sentDate ?? this.sentDate,
      isDraft: isDraft ?? this.isDraft,
      sentRecipients: sentRecepients ?? sentRecipients,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sentDate': sentDate.millisecondsSinceEpoch,
      'isDraft': isDraft,
      'sentRecepients': sentRecipients.map((x) => x.toMap()).toList(),
    };
  }

  factory SentModel.fromMap(Map<String, dynamic> map) {
    return SentModel(
      sentDate: DateTime.fromMillisecondsSinceEpoch(map['sentDate'] as int),
      isDraft: map['isDraft'] as bool,
      sentRecipients: List<SentRecipient>.from(
        (map['sentRecepients'] as List<int>).map<SentRecipient>(
          (x) => SentRecipient.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SentModel.fromJson(String source) =>
      SentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SentModel(sentDate: $sentDate, isDraft: $isDraft, sentRecepients: $sentRecipients)';

  @override
  bool operator ==(covariant SentModel other) {
    if (identical(this, other)) return true;

    return other.sentDate == sentDate &&
        other.isDraft == isDraft &&
        listEquals(other.sentRecipients, sentRecipients);
  }

  @override
  int get hashCode =>
      sentDate.hashCode ^ isDraft.hashCode ^ sentRecipients.hashCode;
}

class SentRecipient {
  String emailAddress;
  bool delivered;
  bool opened;
  SentRecipient({
    required this.emailAddress,
    required this.delivered,
    required this.opened,
  });

  SentRecipient copyWith({
    String? emailAddress,
    bool? delivered,
    bool? opened,
  }) {
    return SentRecipient(
      emailAddress: emailAddress ?? this.emailAddress,
      delivered: delivered ?? this.delivered,
      opened: opened ?? this.opened,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'emailAddress': emailAddress,
      'delivered': delivered,
      'opened': opened,
    };
  }

  factory SentRecipient.fromMap(Map<String, dynamic> map) {
    return SentRecipient(
      emailAddress: map['emailAddress'] as String,
      delivered: map['delivered'] as bool,
      opened: map['opened'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SentRecipient.fromJson(String source) =>
      SentRecipient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SentRecepient(emailAddress: $emailAddress, delivered: $delivered, opened: $opened)';

  @override
  bool operator ==(covariant SentRecipient other) {
    if (identical(this, other)) return true;

    return other.emailAddress == emailAddress &&
        other.delivered == delivered &&
        other.opened == opened;
  }

  @override
  int get hashCode =>
      emailAddress.hashCode ^ delivered.hashCode ^ opened.hashCode;
}
