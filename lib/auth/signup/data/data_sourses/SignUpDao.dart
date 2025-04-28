import 'package:dartz/dartz.dart';

import '../models/SignUpResponse.dart';

abstract class SignUpDao {


  Future<Either<SignUpResponse,String>> CreateAccount({
    required String name, required String phone_number, required String address, required String password,
    required String user_type});
  // }) ;async {
  //   try {
  //     var response = await dio.post(Endpoint.SignUpEndpoint, data: {});
  //     if (response.statusCode?.isSuccessRequest == true) {
  //       var signUpResponse = SignUpResponse.fromJson(response.data);
  //       return Success(data: SignUpResponse);
  //     } else {
  //       var errorResponse = ErrorResponse..fromJson(response.data);
  //       return ServerError(serverException: ServerException(
  //           statusMsg: errorResponse.statusMsg ?? '',
  //           message: errorResponse.message ?? ''));
  //     }
  //   } on Exception catch (ex) {
  //     return Error(exception: ex);
  //   }
  // }
}