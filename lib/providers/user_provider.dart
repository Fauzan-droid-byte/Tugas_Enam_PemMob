import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  final UserModel _user = UserModel(
    name: 'Fauzan',
    university: 'Universitas Gadjah Mada',
    isPremium: false,
    streak: 1,
  );

  UserModel get user => _user;

  void togglePremium() {
    _user.isPremium = !_user.isPremium;
    notifyListeners();
  }

  void updateName(String newName) {
    _user.name = newName;
    notifyListeners();
  }
}