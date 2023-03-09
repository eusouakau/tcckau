import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import './authException.dart';

enum AuthMode {
  LOGIN,
  SIGNUP,
}

class AuthData extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String name = '';
  String email = '';
  String password = '';
  String token = '';
  AuthMode _mode = AuthMode.LOGIN;
  String body = '';

  bool get isSignup {
    return _mode == AuthMode.SIGNUP;
  }

  bool get isLogin {
    return _mode == AuthMode.LOGIN;
  }

  void toggleMode() {
    _mode = _mode == AuthMode.LOGIN ? AuthMode.SIGNUP : AuthMode.LOGIN;
  }

  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }

  signup(String email, String name, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _getUser();
      await usuario?.sendEmailVerification();
      usuario?.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthErro("Utilize uma senha mais forte");
      } else if (e.code == 'email-already-in-use') {
        throw AuthErro("Este email já esta cadastrado");
      }
    }
  }

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthErro("Email ou senha incorretos");
      } else if (e.code == 'wong-password') {
        throw AuthErro("Email ou senha incorretos");
      }
    }
  }

}
