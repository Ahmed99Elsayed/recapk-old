class User {
  final String uid;
  User({this.uid});
}

class UserInformation {
  String _uid;
  String _email;
  String _userName;
  String _fullName;
  String _password;
  String _about;
  String _age;
  String _facebookLink;
  String _phone;
  String _photo;

  UserInformation(
      this._uid,
      this._userName,
      this._email,
      this._fullName,
      this._password,
      this._age,
      this._phone,
      this._about,
      this._facebookLink,
      this._photo);

  String get uid => _uid;

  set uid(String value) {
    if (_uid.length > 0) _uid = value;
  }

  String get userName => _userName;

  set userName(String value) {
    if (value.length > 0) _userName = value;
  }

  String get fullName => _fullName;

  set fullName(String value) {
    if (value.length > 0) _fullName = value;
  }

  String get photo => _photo;

  set photo(String value) {
    if (value.length > 0) _photo = value;
  }

  String get age => _age;

  set age(String value) {
    if (value.length > 0) _age = value;
  }

  String get email => _email;

  set email(String value) {
    if (value.length > 0) _email = value;
  }

  String get password => _password;

  set password(String value) {
    if (value.length > 0) _password = value;
  }

  String get about => _about;

  set about(String value) {
    if (value.length > 0) _about = value;
  }

  String get facebookLink => _facebookLink;

  set facebookLink(String value) {
    if (value.length > 0) _facebookLink = value;
  }

  String get phone => _phone;

  set phone(String value) {
    if (value.length > 0) _phone = value;
  }
}
