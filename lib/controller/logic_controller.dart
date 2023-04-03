import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum FormType {
  loginCtrl,
  registerCtrl,
}

class LogicController extends ChangeNotifier {
  LogicController() {
    getUser();
  }

  FormType _formType = FormType.loginCtrl;
  int _selectedIndex = 0;
  FirebaseAuth auth = FirebaseAuth.instance;
  final StreamController<User?> userStreamController =
      StreamController<User?>();

  FormType get formType => _formType;
  int get selectedIndex => _selectedIndex;

  void showForm(FormType formType) {
    _formType = formType;
    notifyListeners();
  }

  getIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  getUser() {
    auth.authStateChanges().listen((user) {
      userStreamController.add(user);
    });
    notifyListeners();
  }

  @override
  void dispose() {
    userStreamController.close();
    super.dispose();
  }
}

class UserModel {
  final String? email;
  UserModel({this.email});
}
