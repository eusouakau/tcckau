import 'package:flutter/material.dart';
import 'package:tcckau/screens/teamScreen.dart';
//import 'package:pense_responda/utils/colors.dart';

class StartCard extends StatelessWidget {
  const StartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(40, 40, 40, 1),
          ),
          padding: const EdgeInsets.only(top: 25, bottom: 25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 48),
                child: Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                          left: 47.5,
                          right: 47.5,
                          top: 55,
                          bottom: 55,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: const Color.fromRGBO(0, 170, 255, 5),
                      ),
                      child: const Text(
                        'Solo',
                        style: TextStyle(
                          color: Color.fromRGBO(45, 45, 45, 1),
                        ),
                      ),
                      onPressed: () => {},
                    ),
                    const SizedBox(width: 25),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                          left: 31.5,
                          right: 31.5,
                          top: 43,
                          bottom: 43,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: const Color.fromRGBO(100, 130, 255, 5),
                      ),
                      child: const Text(
                        'Desafio \n   1x1',
                        style: TextStyle(
                          color: Color.fromRGBO(45, 45, 45, 1),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TeamScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 48),
                child: Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                           left: 31.5,
                          right: 31.5,
                          top: 43,
                          bottom: 43,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: const Color.fromRGBO(130, 220, 190, 5),
                      ),
                      child: const Text(
                        'Desafio \n   2x2',
                        style: TextStyle(
                          color: Color.fromRGBO(45, 45, 45, 1),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TeamScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 25),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                          left: 31.5,
                          right: 31.5,
                          top: 43,
                          bottom: 43,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.yellowAccent,
                      ),
                      child: const Text(
                        'Desafio \n   3x3',
                        style: TextStyle(
                          color: Color.fromRGBO(45, 45, 45, 1),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TeamScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(
                    left: 60,
                    right: 60,
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
                  'Mediar Partida',
                  style: TextStyle(
                    color: Color.fromRGBO(200, 200, 200, 1),
                  ),
                ),
                // ignore: avoid_returning_null_for_void
                onPressed: () => null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
