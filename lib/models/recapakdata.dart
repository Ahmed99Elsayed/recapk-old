class ReCapakUserData {
  String _title;
  String _recap;
  String _type;

  ReCapakUserData(this._title, this._recap, this._type);

  String get title => _title;

  set title(String value) {
    if (value.length > 0) _title = value;
  }

  String get recap => _recap;

  set recap(String value) {
    if (value.length > 0) _recap = value;
  }

  String get type => _type;

  set type(String value) {
    if (value.length > 0) _type = value;
  }
}
