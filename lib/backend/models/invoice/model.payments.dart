// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Payments {
  DateTime date;
  double amount;
  Payments({
    required this.date,
    required this.amount,
  });

  Payments copyWith({
    DateTime? date,
    double? amount,
  }) {
    return Payments(
      date: date ?? this.date,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'amount': amount,
    };
  }

  factory Payments.fromMap(Map<String, dynamic> map) {
    return Payments(
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      amount: map['amount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Payments.fromJson(String source) =>
      Payments.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Payments(date: $date, amount: $amount)';

  @override
  bool operator ==(covariant Payments other) {
    if (identical(this, other)) return true;

    return other.date == date && other.amount == amount;
  }

  @override
  int get hashCode => date.hashCode ^ amount.hashCode;
}
