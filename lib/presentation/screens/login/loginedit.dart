import 'package:flutter/material.dart';

import '../../../core/utils/routes_manager.dart';

class LoginPage extends StatelessWidget { @override Widget build(BuildContext context) {
  return Scaffold( backgroundColor: Color(0xFF003366),
    body: Center(
      child: Padding( padding: const EdgeInsets.all(16.0),
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( 'Route', style: TextStyle( fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white, ), ),
            SizedBox(height: 40),
          //  SizedBox(height: 8),
            Text( 'Please sign in with your phone', style: TextStyle( fontSize: 16, color: Colors.white, ), ),
            SizedBox(height: 32),
            TextField(
              decoration:
              InputDecoration(
                labelText: 'User Name',
                labelStyle: TextStyle(color: Colors.white),
                filled: true, fillColor: Colors.white,
                border: OutlineInputBorder( borderRadius: BorderRadius.circular(8), ), hintText: 'enter your name', ), ),
            SizedBox(height: 16),
            TextField( obscureText: true,
              decoration:
              InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                filled: true, fillColor: Colors.white, border: OutlineInputBorder( borderRadius: BorderRadius.circular(8), ),
                hintText: 'enter your password', suffixIcon: Icon(Icons.visibility, color: Colors.grey), ), ),
            SizedBox(height: 16),
            Align( alignment: Alignment.centerRight,
              child: Text( 'Forgot password', style: TextStyle( color: Colors.white, fontSize: 14, ), ), ),
            SizedBox(height: 32),
            ElevatedButton( onPressed: () {
              Navigator.of(context).pushReplacementNamed(RoutesManager.home);

            }, style: ElevatedButton.styleFrom( backgroundColor: Colors.white, foregroundColor: Color(0xFF003366),
              padding: EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8), ), ),
              child: Center(
                child: Text( 'Login', style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold, ), ), ), ),
            SizedBox(height: 16),
            TextButton(onPressed: () {
              Navigator.of(context).pushReplacementNamed(RoutesManager.signUp);
            },
            child: Text( 'Don’t have an account? Create Account', style: TextStyle( color: Colors.white, fontSize: 14, ), )), ], ), ), ), ); } }