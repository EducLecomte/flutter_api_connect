class Profil {
  String _email = "";
  String _token = "";

  Profil(this._email, this._token);
  Profil.vierge();

  String getEmail() {
    return this._email;
  }

  String getToken() {
    return this._token;
  }

  @override
  String toString() {
    return "email:" + _email + "; token:" + _token;
  }
}
