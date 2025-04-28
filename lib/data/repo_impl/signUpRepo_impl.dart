
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../auth/signup/data/data_sourses/SignUpDao.dart';
import '../../domain/Entities/SignUpEntity.dart';
import '../../domain/repo/SignUpRepo.dart';


@Injectable(as : SignUpRepo)
class signUpRepoImpl extends SignUpRepo{
  SignUpDao signUpDao;
  //SignUpDao signUpCachDao;
@factoryMethod
signUpRepoImpl(this.signUpDao);
  @override
  Future<Either<SignUpEntity, String>> CreateAccount({required String name, required String phone_number, required String address, required String password, required String user_type})async {
   // bool isconnected = await InternetChecker.checkNetwork();
   // if (isconnected) {
          var result = await signUpDao.CreateAccount(
          name: name,
          phone_number: phone_number,
          address: address,
          password: password,
          user_type: user_type);
      return result.fold((response) {
        return Left(response.toSignUpEntity());
      },(error){
        return Right(error);
      });

    // }else{
    //
    //   return Right("no internet connection");
    // }
  }
}



// @override
//     required String rePassword})async {
//   var result = await signUpDataSource.signUp(name: name,
//       email: email,
//       phone: phone,
//       password: password,
//       rePassword: password);
//   switch(result) {
//
//     case Success<SignUpResponse>():
//     return Success(data : result.data.toSignUpEntity());
//     case ServerError<SignUpResponse>():
//     return ServerError(ServerExecption : result.serverExecption );
//     case Error<SignUpResponse>():
//     return Error(exception
//     :
//     result
//     .
//     exception
//     );
//
//   }
// }

