class Registermodel {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? gender;
  String? passwordConfirmation;

  Registermodel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.gender,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "gender": gender,
      "password_confirmation": passwordConfirmation,
    };
  }
}
