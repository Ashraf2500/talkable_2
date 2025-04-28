import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/Entities/SignUpEntity.dart';
import '../../domain/Reprositories/signInRepo.dart';
import '../data_sources/SignInDao.dart';


@Injectable(as: SignInRepo)

class SignInRepoImpl extends SignInRepo{
  SignInDao signInDao;
  @factoryMethod
  SignInRepoImpl(this.signInDao);
  @override
  Future<Either<String,SignUpEntity>> login({required String phone_number, required String password}) async{
   // bool isConnected=await InternetChecker.checkNetwork;
    //if(isConnected){
      var result = await signInDao.login(phone: phone_number, password: password);
      return result.fold(
            (error) => Left(error), // لو فيه خطأ
            (response) => Right(response.toSignUpEntity()), // لو العملية نجحت
      ); //}else{
      //return Right("no internet connection");
   // }
    }
    }




