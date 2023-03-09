import 'package:flutter/material.dart';
import 'package:tcckau/screens/startScreen.dart';
import 'package:tcckau/routes/appRoutes.dart';
//import 'package:pense_responda/widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pense e Responda',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(0, 170, 255, 5),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.AUTH_SCREEN);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(40, 40, 40, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(
                            left: 106,
                            right: 106,
                            top: 20,
                            bottom: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          textStyle: const TextStyle(fontSize: 14),
                          backgroundColor: Color.fromRGBO(0, 170, 255, 5),
                        ),
                        child: const Text(
                          'Continuar',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 5),
                          ),
                        ),
                        onPressed: () => null,
                      ),
                      const SizedBox(height: 17),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(
                            left: 89,
                            right: 89,
                            top: 20,
                            bottom: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          textStyle: const TextStyle(fontSize: 14),
                          backgroundColor: Colors.yellowAccent,
                        ),
                        child: const Text(
                          '+ Iniciar partida',
                          style: TextStyle(
                            color: Color.fromRGBO(45, 45, 45, 1),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StartScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 60),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 200,
                            top: 17,
                            bottom: 17,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          textStyle: const TextStyle(fontSize: 14),
                          backgroundColor: const Color.fromRGBO(50, 50, 50, 1),
                        ),
                        onPressed: null,
                        child: const Text(
                          'Ver mão',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 175,
                            top: 17,
                            bottom: 17,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          textStyle: const TextStyle(fontSize: 14),
                          backgroundColor: Color.fromRGBO(50, 50, 50, 1),
                        ),
                        onPressed: null,
                        child: const Text(
                          'Ver tabuleiro',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 145,
                            top: 17,
                            bottom: 17,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          textStyle: const TextStyle(fontSize: 14),
                          backgroundColor: Color.fromRGBO(50, 50, 50, 1),
                        ),
                        onPressed: null,
                        child: const Text(
                          'Ranking semanal',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 130,
                            top: 17,
                            bottom: 17,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          textStyle: const TextStyle(fontSize: 14),
                          backgroundColor: Color.fromRGBO(50, 50, 50, 1),
                        ),
                        onPressed: null,
                        child: const Text(
                          'Questões avaliadas',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 5),
                          ),
                        ),
                      ),
                    ],
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
