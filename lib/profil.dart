class Profil {
  // attributs
  String _email = "";
  String _token = "";

  // constructeurs
  Profil(this._email, this._token);
  Profil.vierge();

  // getter et setter
  String getEmail() {
    return this._email;
  }

  String getToken() {
    return this._token;
  }

  // autres méthodes
  @override
  String toString() {
    return "email:" + _email + "; token:" + _token;
  }
}
