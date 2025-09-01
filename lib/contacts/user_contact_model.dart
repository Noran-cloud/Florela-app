class UserContact {
  final int? id;
  final String name;
  final String email;
  final String phone;

  UserContact({this.id, required this.name, required this.email, required this.phone});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  factory UserContact.fromMap(Map<String, dynamic> map) {
    return UserContact(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
    );
  }
}
