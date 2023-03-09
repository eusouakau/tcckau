// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tcckau/services/auth.dart';
import 'package:tcckau/screens/homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({super.key});

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _form = GlobalKey();
  final AuthData _authData = AuthData();
  String userLogIn = '';

  final Map<String, String> _data = {
    'email': '',
    'name': '',
    'password': '',
  };

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  onLogin(Map map) async {
    return await _authData.login(map['email'], map['password']);
  }

  onSignup(Map map) async {
    await _authData.signup(map['email'], map['name'], map['password']);
  }

  final _controllerName = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(40, 40, 40, 1),
          ),
          height: _authData.isSignup ? 470 : 455,
          width: 320,
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _form,
            child: Column(
              children: newMethod,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> get newMethod {
    return <Widget>[
      if (_authData.isSignup)
        TextFormField(
          controller: _controllerName,
          decoration: InputDecoration(
            fillColor: const Color.fromRGBO(30, 30, 30, 1),
            filled: true,
            labelText: 'Nome',
            labelStyle: const TextStyle(
              color: Color.fromRGBO(200, 200, 200, 1),
            ),
            contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: (value) => _data['name'] = _controllerName.text,
        ),
      const SizedBox(height: 25),
      TextFormField(
        controller: _controllerEmail,
        decoration: InputDecoration(
          fillColor: const Color.fromRGBO(30, 30, 30, 1),
          filled: true,
          labelText: 'E-mail',
          labelStyle: const TextStyle(
            color: Color.fromRGBO(200, 200, 200, 1),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value) => _data['email'] = _controllerEmail.text,
      ),
      const SizedBox(height: 25),
      TextFormField(
        controller: _controllerPassword,
        decoration: InputDecoration(
          fillColor: const Color.fromRGBO(30, 30, 30, 1),
          filled: true,
          labelText: 'Senha',
          labelStyle: const TextStyle(
            color: Color.fromRGBO(200, 200, 200, 1),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        obscureText: true,
        onChanged: (value) => _data['password'] = _controllerPassword.text,
      ),
      SizedBox(height: _authData.isSignup ? 80 : 130),
      _authData.isSignup
          ? TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                  left: 94,
                  right: 94,
                  top: 15,
                  bottom: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                textStyle: const TextStyle(fontSize: 14),
                backgroundColor: Colors.yellowAccent,
              ),
              child: const Text(
                'CADASTRAR',
                style: TextStyle(
                  color: Color.fromRGBO(45, 45, 45, 1),
                ),
              ),
              onPressed: () => {}, //onSignup(_data),
            )
          : TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                  left: 106,
                  right: 106,
                  top: 15,
                  bottom: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                textStyle: const TextStyle(fontSize: 14),
                backgroundColor: Colors.yellowAccent,
              ),
              child: const Text(
                'ENTRAR',
                style: TextStyle(
                  color: Color.fromRGBO(45, 45, 45, 1),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),
      const SizedBox(height: 10),
      _authData.isSignup
          ? TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                  left: 106,
                  right: 106,
                  top: 15,
                  bottom: 15,
                ),
                textStyle: const TextStyle(fontSize: 14),
                backgroundColor: const Color.fromRGBO(50, 50, 50, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'ENTRAR',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 5),
                ),
              ),
              onPressed: () {
                setState(() {
                  _authData.toggleMode();
                });
              },
            )
          : TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                  left: 94,
                  right: 94,
                  top: 15,
                  bottom: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                textStyle: const TextStyle(fontSize: 14),
                backgroundColor: const Color.fromRGBO(50, 50, 50, 1),
              ),
              child: const Text(
                'CADASTRAR',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 5),
                ),
              ),
              onPressed: () {
                setState(() {
                  _authData.toggleMode();
                });
              },
            ),
    ];
  }
}
