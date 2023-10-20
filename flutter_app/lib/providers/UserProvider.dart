import 'package:flutter/foundation.dart';

import '../model/User.dart';

class UserProvider with ChangeNotifier {
  String? name;
  String? cpf;
  String? email;
  UserType? type;

  void setUser({String? name, String? email, String? cpf, UserType? type}) {
    this.name = name;
    this.email = email;
    this.cpf = cpf;
    this.type = type;
    notifyListeners();
  }
}
