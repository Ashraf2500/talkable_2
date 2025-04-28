
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../Entities/SignUpEntity.dart';
import '../repo/SignUpRepo.dart';

@injectable
class signUpUseCase{
   SignUpRepo signUpRepo;
    @factoryMethod
    signUpUseCase({required this.signUpRepo});


   Future<Either<SignUpEntity, String>> call({required String name , required String phone_number , required String address , required String password,
     required String user_type})=>
      signUpRepo.CreateAccount
        (name: name, phone_number: phone_number, address: address, password: password, user_type: user_type);






}