import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StringsManager{

  static const String baseUrl ="http://192.168.1.13:5000";
  //static const String baseUrl ="http://127.0.0.1:5000";  // for web
  //static const String baseUrl ="http://10.0.2.2:5000"; // for emulator

  static showToast(String message ){Fluttertoast.showToast(
  msg: message,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 1,
  backgroundColor: Colors.red,
  textColor: Colors.white,
  fontSize: 16.0
  ); }
}
