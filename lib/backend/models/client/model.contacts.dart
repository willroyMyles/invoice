// ignore_for_file: public_member_api_docs, sort_constructors_first
class Contacts {
  String id;
  String email;
  Contacts({
    this.id = '',
    this.email = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': "'$email'",
    };
  }

  factory Contacts.fromMap(Map<String, dynamic> map) {
    return Contacts(
      id: (map['id'] ?? '') as String,
      email: (map['email'] ?? '') as String,
    );
  }

  @override
  String toString() => 'Contacts(id: $id, email: $email)';
}
