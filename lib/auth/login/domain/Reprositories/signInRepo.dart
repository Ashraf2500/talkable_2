import 'package:dartz/dartz.dart';

import '../../../../domain/Entities/SignUpEntity.dart';

abstract class  SignInRepo{
  Future<Either<String,SignUpEntity>> login({
    required String phone_number,
    required String password,
});
}