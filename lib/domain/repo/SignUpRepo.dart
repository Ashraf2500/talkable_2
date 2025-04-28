import 'package:dartz/dartz.dart';

import '../Entities/SignUpEntity.dart';

abstract class  SignUpRepo{
  Future<Either<SignUpEntity, String>> CreateAccount({
    required String name,
    required String phone_number,
    required String address,
    required String password,
    required String user_type});
}