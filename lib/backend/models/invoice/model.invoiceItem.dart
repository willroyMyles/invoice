// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class InvoiceItemModel {
  String description;
  int quantity;
  double price;
  double total;
  InvoiceItemModel({
    required this.description,
    required this.quantity,
    required this.price,
    required this.total,
  });

  InvoiceItemModel copyWith({
    String? description,
    int? quantity,
    double? price,
    double? total,
  }) {
    return InvoiceItemModel(
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'quantity': quantity,
      'price': price,
      'total': total,
    };
  }

  factory InvoiceItemModel.fromMap(Map<String, dynamic> map) {
    return InvoiceItemModel(
      description: map['description'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as double,
      total: map['total'] as double,
    );
  }
  factory InvoiceItemModel.empty() {
    return InvoiceItemModel(
      description: 'description',
      quantity: 1,
      price: 0,
      total: 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceItemModel.fromJson(String source) =>
      InvoiceItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InvoiceItemModel(description: $description, quantity: $quantity, price: $price, total: $total)';
  }

  @override
  bool operator ==(covariant InvoiceItemModel other) {
    if (identical(this, other)) return true;

    return other.description == description &&
        other.quantity == quantity &&
        other.price == price &&
        other.total == total;
  }

  @override
  int get hashCode {
    return description.hashCode ^
        quantity.hashCode ^
        price.hashCode ^
        total.hashCode;
  }
}
