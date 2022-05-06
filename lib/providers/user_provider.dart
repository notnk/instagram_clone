import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier{
  
  User? _user;
  final AuthMethods _authMethods = AuthMethods();
  User get getUser => _user!;

  Future<void> refresUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}