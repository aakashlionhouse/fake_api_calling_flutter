class AuthModel {
  late final String name;
  late final String email;
  late final String password;


  AuthModel({
    required this.name,
    required this.email,
    required this.password,

  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,

    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
        name: map['name'],
        email: map['email'],
        password: map['password'],

    );
    }
}
