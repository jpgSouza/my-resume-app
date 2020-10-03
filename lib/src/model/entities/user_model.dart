class User {
  String _name;
  String _email;
  String _password;
  String _confirmPassword;

  User(this._name, this._email, this._password, this._confirmPassword);

  User.def();

  Map<String, dynamic> toMap() {
    return {
      'name': this._name,
      'email': this._email,
    };
  }
}
