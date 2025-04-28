import 'package:flutter/material.dart';


import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/routes_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: ColorsManager.Grey,
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Center(child: Image.asset(AssetsManager.logoPhoto,width: 120,height: 120,)),
          SizedBox(height: 70,),
          TextField(
            decoration:  InputDecoration(
              hintText: "Email address or username  ",
              hintStyle: TextStyle(color: Color(0xFFFFFFFF)),
              enabledBorder:
              OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white
                  )
              )
            ),
          ),
          SizedBox(height: 15,),
          TextField(
            decoration: InputDecoration(
              hintText: "Password ",
              hintStyle: TextStyle(color: Color(0xFFFFFFFF)),
              enabledBorder:
                OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white
                    )
                )
            ),

          ),
          SizedBox(height: 15,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(

                backgroundColor: ColorsManager.BlueSky,
                padding: EdgeInsets.symmetric(
                  horizontal: 100,
                )
            ),

            onPressed: (){
              Navigator.of(context).pushReplacementNamed(RoutesManager.home);

            },
            child: Text("LOG IN" , style:
            TextStyle(
              color: ColorsManager.White,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),),
          ),


          SizedBox(height: 100,),
          TextButton(onPressed:()
          {

          }, child: Text("Create new account" , style: TextStyle(
            color: Colors.white,
          ),)),
          TextButton(onPressed:()
          {

          }, child: Text("Forget Password ? " , style: TextStyle(
            color: Colors.white,
          ),)),



        ],
      ),
    );
  }
}
