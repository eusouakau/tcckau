import 'package:flutter/material.dart';
import 'package:tcckau/widgets/startCard.dart';
import 'package:tcckau/routes/appRoutes.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

//  const StartScreen({ Key? key }) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.HOME_SCREEN);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(40, 40, 40, 1),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Column(
                children: const [
                  Text(
                    'Iniciar Partida',
                    style: TextStyle(
                      color: Color.fromRGBO(185, 185, 185, 1),
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Escolha um modo de jogo:',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            StartCard(),
          ],
        ),
      ),
    );
  }
}
