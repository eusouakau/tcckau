import 'package:flutter/material.dart';
import 'package:tcckau/screens/authScreen.dart';
//import 'package:tcckau/utils/colors.dart';
import 'package:tcckau/utils/images.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthScreen(),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        width: 500,
        height: 1500,
        decoration: BoxDecoration(
          color: Color.fromRGBO(40, 40, 40, 1),
        ),
        child: Image.asset(AppImages.logo),
      ),
    );
  }
}