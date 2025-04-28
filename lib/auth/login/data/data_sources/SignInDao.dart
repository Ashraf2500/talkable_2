import 'package:dartz/dartz.dart';

import '../../../signup/data/models/SignUpResponse.dart';

abstract class SignInDao{

 Future<Either<String,SignUpResponse>> login({required String phone,required String password});




}