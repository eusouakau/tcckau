import 'package:flutter/material.dart';
import 'package:tcckau/routes/appRoutes.dart';
import 'package:tcckau/widgets/teamCard.dart';

class TeamScreen extends StatefulWidget {
  // const TeamScreen({ Key? key }) : super(key: key);

  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text(
          'Iniciar partida',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(185, 185, 185, 1),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(30, 30, 30, 1),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.START_SCREEN);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(40, 40, 40, 1),
          ),
          padding: EdgeInsets.only(top: 60, bottom: 40),
          child: Column(
            children: [
              SizedBox(height: 10),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 70,
                    ),
                    child: Text(
                      'Formar equipe',
                      style: TextStyle(
                        color: Color.fromRGBO(185, 185, 185, 1),
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              TeamCard(),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
