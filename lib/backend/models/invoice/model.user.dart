// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String id;
  String email;
  String name;
  String photoUrl;
  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.photoUrl,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? photoUrl,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      photoUrl: map['photoUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, name: $name, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.name == name &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^ email.hashCode ^ name.hashCode ^ photoUrl.hashCode;
  }
}

class AuthModel {
  String ns;
  String db;
  String sc;
  String email;
  String pass;
  AuthModel({
    this.ns = "invns",
    this.db = "invdb",
    this.sc = "account",
    required this.email,
    required this.pass,
  });

  AuthModel copyWith({
    String? ns,
    String? db,
    String? sc,
    String? email,
    String? pass,
  }) {
    return AuthModel(
      ns: ns ?? this.ns,
      db: db ?? this.db,
      sc: sc ?? this.sc,
      email: email ?? this.email,
      pass: pass ?? this.pass,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'NS': ns,
      'DB': db,
      'SC': sc,
      'email': email,
      'password': pass,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      ns: map['ns'] as String,
      db: map['db'] as String,
      sc: map['sc'] as String,
      email: map['email'] as String,
      pass: map['pass'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthModel(ns: $ns, db: $db, sc: $sc, email: $email, pass: $pass)';
  }

  @override
  bool operator ==(covariant AuthModel other) {
    if (identical(this, other)) return true;

    return other.ns == ns &&
        other.db == db &&
        other.sc == sc &&
        other.email == email &&
        other.pass == pass;
  }

  @override
  int get hashCode {
    return ns.hashCode ^
        db.hashCode ^
        sc.hashCode ^
        email.hashCode ^
        pass.hashCode;
  }
}
