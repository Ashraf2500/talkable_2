import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/cashe/prefs_handler.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 2),
          () async{
        //Navigator.pushReplacementNamed(context, RoutesManager.login);
            String token = await PrefsHandler.getToken();
            print("token :$token");
            if (token.isNotEmpty) {
              // إذا كان الـ token موجوداً، انتقل إلى صفحة الـ Login
              Navigator.pushReplacementNamed(context, RoutesManager.home);
            } else {
              // إذا لم يكن الـ token موجوداً، انتقل إلى صفحة الـ Signup
              Navigator.pushReplacementNamed(context, RoutesManager.login);
            }

          },
    );

  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
         color: ColorsManager.Grey,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(AssetsManager.logoPhoto,
              width: 199,
              height: 208),
            Spacer(),
            Image.asset(AssetsManager.logoName,),
          ],
        )
      ],
    );

  }
}
