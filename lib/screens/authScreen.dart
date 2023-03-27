import 'package:flutter/material.dart';
//import 'package:pense_responda/utils/colors.dart';
import 'package:tcckau/utils/images.dart';
import '../widgets/authCard.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(40, 40, 40, 1),
          ),
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 81, 50, 0),
                              child: Image.asset(AppImages.logo),
                            ),
                            const AuthCard(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
