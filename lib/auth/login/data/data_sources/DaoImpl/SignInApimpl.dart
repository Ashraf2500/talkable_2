import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/remote/ApiManager.dart';
import '../../../../../core/remote/endpoints.dart';
import '../../../../signup/data/models/SignUpResponse.dart';
import '../SignInDao.dart';

@Injectable(as: SignInDao)
class SignInApimpl extends SignInDao{
  ApiManager apiManager;
  @factoryMethod
  SignInApimpl(this.apiManager);
  @override
  Future<Either<String,SignUpResponse>> login({required String phone, required String password}) async{
  try{
    var response= await apiManager.postRequest(Endpoint: Endpoints.SignInEndpoint,body: {
      "phone_number":phone,
      "password": password
    });
    var signInResponse = SignUpResponse.fromJson(response.data);
    if(signInResponse.message !=null){
      return Right(signInResponse);
    }else{
      return Left(signInResponse.message!);
    }
  }catch(error){
     return Left(error.toString());
  }
  }

}