import 'package:flutter/material.dart';

import '../../../core/cashe/prefs_handler.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/routes_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.White,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            PrefsHandler.clearToken();
            Navigator.pushReplacementNamed(context, RoutesManager.login);
          }, icon: Icon(
            Icons.logout
          ))
        ],

        backgroundColor: ColorsManager.b2,
        title: Text('Home',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 40 , ),),
      ),
        body: Column(
          children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context,RoutesManager.translation);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManager.b1,


              ),
            padding: EdgeInsets.only(
              top: 30,
              bottom: 30,
              left: 20,
            ),
            margin: EdgeInsets.only(
                top: 100,
                right: 20,
                left: 20
            ),
            child: Row(
                children: [
                  Expanded(
                    child: Text("Translation",style: TextStyle(
                      color: ColorsManager.White,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
                  ),
                  Expanded
                    (child: CircleAvatar(
                     radius: 30,
                      backgroundImage:  AssetImage(AssetsManager.translation ,) ,
                    )),
                ]),
        ),
          ),
        Spacer(),
        InkWell(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsManager.b2,
            ),
            padding: EdgeInsets.only(
              top: 30,
              bottom: 30,
              left: 20,
            ),

            margin: EdgeInsets.symmetric(
                horizontal: 20
            ),
            child: Row(
                children: [
                  Expanded(
                    child: Text("Private Session",style: TextStyle(
                      color: ColorsManager.White,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
                  ),
                  Expanded(child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(AssetsManager.privateSession),
                  )),
                ]),
          ),
        ),
        Spacer(),
        InkWell(
            onTap: (){
                 Navigator.pushNamed(context,RoutesManager.education);
                    },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsManager.b3,

            ),
            padding: EdgeInsets.only(
              top: 30,
              bottom: 30,
              left: 20,
            ),
            margin: EdgeInsets.symmetric(
                horizontal: 20
            ),
            child: Row(
                children: [
                  Expanded(
                    child: Text("Learning videos",style: TextStyle(
                      color: ColorsManager.White,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
                  ),
                  Expanded(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(AssetsManager.learning),
                  )),
                ]),
          ),
        ),
        Spacer(),
        ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontSize: 22),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: ColorsManager.b2,
        type: BottomNavigationBarType.fixed,
        items: [ BottomNavigationBarItem( icon: Icon(Icons.grid_view, color: Colors.white), label: 'Home', ),
          BottomNavigationBarItem( icon: Icon(Icons.phone, color: Colors.white), label: 'Contact Us', ),
          BottomNavigationBarItem( icon: Icon(Icons.notifications, color: Colors.white), label: 'Notification', ),
        BottomNavigationBarItem( icon: Icon(Icons.person, color: Colors.white), label: 'Profile',
        ), ], ), ); } }


