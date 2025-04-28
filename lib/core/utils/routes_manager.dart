import 'package:flutter/material.dart';

import '../../auth/login/presentation/pages/login_edit.dart';
import '../../auth/signup/presentation/pages/signup.dart';
import '../../presentation/screens/educationScreen/presentation/EducationScreen.dart';
import '../../presentation/screens/home/home.dart';
import '../../presentation/screens/splash/splash_screen.dart';
import '../../presentation/screens/translationScreen/translaionedit.dart';



class RoutesManager {
  static const String home = "/HomeScreen";
  static const String splash = "/splash_screen";
  static const String login = "/LoginScreen";
  static const String signUp = "/SignUpPage";
  static const String translation = "/HomePage";
  static const String education = "/EducationScreen";




  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case signUp:
        return MaterialPageRoute(builder: (context) => SignUpPage());

      case splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case home :
        return MaterialPageRoute(builder: (context) =>  HomeScreen());

      case translation :
        return MaterialPageRoute(builder: (context) =>  HomePage2());


      case education :
        return MaterialPageRoute(builder: (context) =>  EducationScreen());




    }
  }
}