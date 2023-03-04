import 'package:flutter/material.dart';
import 'package:tcckau/screens/splashScreen.dart';
import 'package:tcckau/screens/startScreen.dart';
import 'package:tcckau/widgets/search.dart';

import './screens/authScreen.dart';
import './routes/appRoutes.dart';
import './utils/colors.dart';
import './screens/homeScreen.dart';
//import './screens/init_chat_screen.dart';
//import './screens/chat_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pense&Responda',
      theme: ThemeData(
        primaryColor: Colors.grey,
        backgroundColor: AppColors.darkBackgroundColor,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: AppColors.greenButton,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
        ),
      ),
      routes: {
        AppRoutes.SPLASH_SCREEN: (ctx) => SplashScreen(),
        AppRoutes.AUTH_SCREEN: (ctx) => AuthScreen(),
        AppRoutes.HOME_SCREEN: (ctx) => HomeScreen(),
        AppRoutes.START_SCREEN: (ctx) => StartScreen(),
        //     AppRoutes.INIT_CHAT_SCREEN: (ctx) => InitChatScreen(),
        //     AppRoutes.CHAT_SCREEN: (ctx) => ChatScreen(),
      },
    );
  }
}
