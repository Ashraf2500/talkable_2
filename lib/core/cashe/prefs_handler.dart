import 'package:shared_preferences/shared_preferences.dart';

class PrefsHandler{
 static late SharedPreferences sharedPreferences ;
 static init()async{
   sharedPreferences = await SharedPreferences.getInstance();


 }

 static saveToken (String token ){

   sharedPreferences.setString("token", token);

 }

 static String getToken(){
   return sharedPreferences.getString("token")??"";
 }
 static clearToken(){
   sharedPreferences.remove("token");
 }
}