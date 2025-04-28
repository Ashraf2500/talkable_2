import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


import '../../../../../core/remote/ApiManager.dart';
import '../../../../../core/remote/endpoints.dart';
import '../../models/SignUpResponse.dart';
import '../SignUpDao.dart';

@Injectable(as: SignUpDao)
class SignDaoApiimpl extends SignUpDao{
  ApiManager apiManager;
  @factoryMethod
  SignDaoApiimpl(this.apiManager);
  @override
  Future<Either<SignUpResponse, String>> CreateAccount({
    required String name,
    required String phone_number,
    required String address,
    required String password,
    required String user_type})async {
    try{

      var response = await apiManager.postRequest(Endpoint: Endpoints.SignUpEndpoint,body:
      {
        "name": name,
        "phone_number": phone_number,
        "address": address,
        "user_type": user_type ,
        "password": password

      });

      print("ashraf response ===> ${response.data}");

      var signUpResponse = SignUpResponse.fromJson(response.data);

          //   var response = await dio.post(Endpoint.SignUpEndpoint,data: {});
             if(signUpResponse.error!=null){
              //  return Right(signUpResponse.message!);
               return Right(signUpResponse.error!);

             }else{
               return Left(signUpResponse);
          //     var errorResponse = ErrorResponse..fromJson(response.data);
          //     return ServerError(serverException : ServerException(statusMsg : errorResponse.statusMsg ??'' , message : errorResponse.message?? '' ));
             }
          //
          //
          } catch(error){
                return Right(error.toString());


            }


    }
  }

