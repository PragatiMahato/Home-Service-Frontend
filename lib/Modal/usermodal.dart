class UserModal {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String phone;

  const UserModal(
      {required this.email,
      this.id,
      required this.name,
      required this.password,
      required this.phone});

  toJson() {
    return {"FullName": name, "Email": email, "Phone": phone,"Password":password,};
  }
}
