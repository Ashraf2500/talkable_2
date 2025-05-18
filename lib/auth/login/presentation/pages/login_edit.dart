import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/DI/di.dart';
import '../../../../core/cashe/prefs_handler.dart';
import '../../../../core/utils/routes_manager.dart';
import '../../../../core/utils/strings_manager.dart';
import '../manager/sign_in_view_model_cubit.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInViewModelCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFFFFFFF),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TalkAble',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003C43),
                    fontFamily: 'Raleway',
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Please sign in with your phone number',
                  style: TextStyle(
                    color: Color(0xFF003C43),
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Color(0xFF003C43),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: 'enter your phone',
                    hintStyle: TextStyle(color: Color(0xFFE3FEF7)),
                    filled: true,
                    fillColor: Color(0xFF003C43),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(
                      color: Color(0xFF003C43),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'enter your password',
                    hintStyle: TextStyle(color: Color(0xFFE3FEF7)),
                    filled: true,
                    fillColor: Color(0xFF003C43),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 16),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot password',
                    style: TextStyle(color: Color(0xFF003C43)),
                  ),
                ),
                SizedBox(height: 32),

                /// BlocConsumer handles state changes

                BlocConsumer<SignInViewModelCubit, SignInViewModelState>(
                  listener: (context, stateLogin) {
                    if (stateLogin is SuccessState) {
                      StringsManager.showToast("login cc successfully");
                      PrefsHandler.saveToken(stateLogin.signUpEntity.token!);
                      Navigator.pushReplacementNamed(
                          context, RoutesManager.home);
                    }
                    if (stateLogin is ErrorState) {
                      StringsManager.showToast(stateLogin.error);
                    }
                  },
                  builder: (context, stateLogin) {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<SignInViewModelCubit>(context).login(
                          phoneController.text,
                          passwordController.text,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF003C43),
                        foregroundColor: Color(0xFFFFFFFF),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RoutesManager.signUp);
                  },
                  child: const Text(
                    'Don’t have an account? Create Account',
                    style: TextStyle(color: Color(0xFF003C43)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
























/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savvyflos/auth/signup/presentation/pages/signup.dart';
import 'package:savvyflos/core/DI/di.dart';
import 'package:savvyflos/core/utils/routes_manager.dart';

import '../../../../core/cashe/prefs_handler.dart';
import '../../../../core/utils/strings_manager.dart';
import '../manager/sign_in_view_model_cubit.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  //Color(0xFF003366)
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SignInViewModelCubit>(),
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.network( 'https://storage.googleapis.com/a1aa/image/hnAOF0ETu8lrAJsw584Nrm372aBfMbOGc34-31TAPdg.jpg',
                //   height: 100, width: 100, ),
                Text(
                  'TalkAble',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003C43),
                    fontFamily: 'Raleway',
                  ),
                ),

                SizedBox(height: 40),
                //Text( 'Welcome Back To Route', style: TextStyle( color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, ), ),
                SizedBox(height: 8),
                Text(
                  'Please sign in with your phone number',
                  style: TextStyle(
                    color: Color(0xFF003C43),
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Color(0xFF003C43),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: 'enter your phone',
                    hintStyle: TextStyle(color: Color(0xFFE3FEF7)),
                    filled: true,
                    fillColor: Color(0xFF003C43),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(
                      color: Color(0xFF003C43),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'enter your password',
                    hintStyle: TextStyle(color: Color(0xFFE3FEF7)),
                    filled: true,
                    fillColor: Color(0xFF003C43),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: Icon(Icons.visibility_off, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot password',
                    style: TextStyle(color: Color(0xFF003C43)),
                  ),
                ),
                SizedBox(height: 32),
                BlocConsumer<SignInViewModelCubit,SignInViewModelState>(
                  listener: (context, state) {
                    if (state is SuccessState) {
                      StringsManager.showToast("login successfully");
                      Navigator.pushReplacementNamed(context, RoutesManager.home);
                    }
                    if (state is ErrorState) {
                      StringsManager.showToast(state.error);
                    }

                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<SignInViewModelCubit>(context).login(
                          phoneController.text,
                          passwordController.text,

                        );
                        Navigator.of(context)
                            .pushReplacementNamed(RoutesManager.home);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF003C43),
                        foregroundColor: Color(0xFFFFFFFF),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: 16),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RoutesManager.signUp);
                      SignInViewModelCubit.get(context)
                          .login(phoneController.text, passwordController.text);
                      // Navigator.of(context).pushReplacementNamed(RoutesManager.signUp);
                    },
                    child: Text(
                      'Don’t have an account? Create Account',
                      style: TextStyle(color: Color(0xFF003C43)),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
