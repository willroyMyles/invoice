// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:slim_voice/backend/enum/enum.currency.dart';

import 'model.invoiceItem.dart';
import 'model.payments.dart';
import 'model.sent.dart';

class InvoiceModel {
  String id;
  String clientId;
  String clientName;
  String? description;
  int invoiceNumber;
  DateTime dateIssued;
  DateTime dateCreated;
  DateTime dateDue;
  List<InvoiceItemModel> invoiceItems;
  Currency currency;
  SentModel sentModel;
  List<Payments> payments;
  double total;
  double subTotal;
  double tax;
  bool isDraft;

  double get amountLeft =>
      payments.map((e) => e.amount).reduce((a, b) => a + b) - total;

  InvoiceModel(
      {required this.id,
      required this.clientId,
      required this.clientName,
      required this.invoiceNumber,
      required this.dateIssued,
      required this.dateCreated,
      required this.dateDue,
      required this.invoiceItems,
      required this.currency,
      required this.sentModel,
      required this.payments,
      required this.total,
      required this.isDraft,
      this.description = "",
      this.subTotal = 0,
      this.tax = 0});

  InvoiceModel copyWith(
      {String? id,
      String? clientId,
      String? clientName,
      int? invoiceNumber,
      DateTime? dateIssued,
      DateTime? dateCreated,
      DateTime? dateDue,
      List<InvoiceItemModel>? invoiceItems,
      Currency? currency,
      SentModel? sentModel,
      List<Payments>? payments,
      double? total,
      bool? isDraft,
      double? subTotal,
      double? tax}) {
    return InvoiceModel(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        clientName: clientName ?? this.clientName,
        invoiceNumber: invoiceNumber ?? this.invoiceNumber,
        dateIssued: dateIssued ?? this.dateIssued,
        dateCreated: dateCreated ?? this.dateCreated,
        dateDue: dateDue ?? this.dateDue,
        invoiceItems: invoiceItems ?? this.invoiceItems,
        currency: currency ?? this.currency,
        sentModel: sentModel ?? this.sentModel,
        payments: payments ?? this.payments,
        total: total ?? this.total,
        isDraft: isDraft ?? this.isDraft,
        description: description,
        subTotal: subTotal ?? this.subTotal,
        tax: tax ?? this.tax);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'clientId': clientId,
      'clientName': clientName,
      'invoiceNumber': invoiceNumber,
      'dateIssued': dateIssued.millisecondsSinceEpoch,
      'dateCreated': dateCreated.millisecondsSinceEpoch,
      'dateDue': dateDue.millisecondsSinceEpoch,
      'invoiceItems': invoiceItems.map((x) => x.toMap()).toList(),
      'currency': currency.index,
      'sentModel': sentModel.toMap(),
      'payments': payments.map((x) => x.toMap()).toList(),
      'total': total,
      'isDraft': isDraft,
      'description': description,
      "subTotal": subTotal,
      "tax": tax
    };
  }

  factory InvoiceModel.fromMap(Map<String, dynamic> map) {
    return InvoiceModel(
        id: map['id'] as String,
        clientId: map['clientId'] as String,
        clientName: map['clientName'] as String,
        description: map['description'],
        invoiceNumber: map['invoiceNumber'] as int,
        dateIssued:
            DateTime.fromMillisecondsSinceEpoch(map['dateIssued'] as int),
        dateCreated:
            DateTime.fromMillisecondsSinceEpoch(map['dateCreated'] as int),
        dateDue: DateTime.fromMillisecondsSinceEpoch(map['dateDue'] as int),
        invoiceItems: List<InvoiceItemModel>.from(
          (map['invoiceItems']).map<InvoiceItemModel>(
            (x) => InvoiceItemModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        currency: Currency.values[map['currency'] as int],
        sentModel: SentModel.fromMap(map['sentModel'] as Map<String, dynamic>),
        payments: List<Payments>.from(
          (map['payments']).map<Payments>(
            (x) => Payments.fromMap(x as Map<String, dynamic>),
          ),
        ),
        total: double.parse(map['total']),
        isDraft: map['isDraft'] as bool,
        subTotal: double.parse(map["subTotal"]),
        tax: double.parse(map['tax']));
  }

  String toJson() => json.encode(toMap());

  factory InvoiceModel.fromJson(String source) =>
      InvoiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory InvoiceModel.empty() {
    return InvoiceModel(
        id: "",
        clientId: "",
        clientName: "",
        invoiceNumber: 0,
        dateIssued: DateTime.now(),
        dateCreated: DateTime.now(),
        dateDue: DateTime.now(),
        invoiceItems: [InvoiceItemModel.empty()],
        currency: Currency.JMD,
        sentModel: SentModel.empty(),
        payments: [],
        total: 0,
        isDraft: true);
  }

  @override
  String toString() {
    return 'InvoiceModel(id: $id, clientId: $clientId, clientName: $clientName, invoiceNumber: $invoiceNumber, dateIssued: $dateIssued, dateCreated: $dateCreated, dateDue: $dateDue, invoiceItems: $invoiceItems, currency: $currency, sentModel: $sentModel, payments: $payments, total: $total, isDraft: $isDraft)';
  }

  @override
  bool operator ==(covariant InvoiceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.clientId == clientId &&
        other.clientName == clientName &&
        other.invoiceNumber == invoiceNumber &&
        other.dateIssued == dateIssued &&
        other.dateCreated == dateCreated &&
        other.dateDue == dateDue &&
        listEquals(other.invoiceItems, invoiceItems) &&
        other.currency == currency &&
        other.sentModel == sentModel &&
        listEquals(other.payments, payments) &&
        other.total == total &&
        other.isDraft == isDraft;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        clientId.hashCode ^
        clientName.hashCode ^
        invoiceNumber.hashCode ^
        dateIssued.hashCode ^
        dateCreated.hashCode ^
        dateDue.hashCode ^
        invoiceItems.hashCode ^
        currency.hashCode ^
        sentModel.hashCode ^
        payments.hashCode ^
        total.hashCode ^
        isDraft.hashCode;
  }
}
