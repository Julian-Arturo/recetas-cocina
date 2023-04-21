import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum FormType {
  loginCtrl,
  registerCtrl,
}

class LogicController extends ChangeNotifier {
  static final LogicController _instance = LogicController._internal();

  FormType _formType = FormType.loginCtrl;
  int _selectedIndex = 0;
  
  //Se declara como final para garantizar que solo haya una unica instacia
  final FirebaseAuth auth = FirebaseAuth.instance; 
  final StreamController<User?> userStreamController =
      StreamController<User?>();

  /*
  Se crea un constructor privado, donde factory crea una unica 
  instacia de la clase y esta única instancia solo
  se puede acceder a través del metodo LoginController
  */

  factory LogicController() {
    return _instance;
  }

  LogicController._internal() {
    getUser();
  }

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
