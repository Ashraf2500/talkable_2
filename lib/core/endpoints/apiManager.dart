/*
import 'package:dio/dio.dart';

import '../utils/strings_manager.dart';

class ApiManager {
  Dio dio = Dio(
      BaseOptions(
          baseUrl: StringsManager.baseUrl
      )

  );

  Future<Response> getRequest({
    required String Endpoint,
    Map<String, dynamic>? queryparam,
    Map<String,dynamic>? headers}) async
  {
    var response = await dio.get(
        Endpoint, queryParameters: queryparam, options: Options(
        headers: headers
    ));
    return response;
  }

  Future<Response> postRequest({
    required String Endpoint , Map<String, dynamic>? headers , Map<String, dynamic>? body
  }) async {
    var response = await dio.post(
        Endpoint,
        data:body ,

        options: Options(

        headers: headers
    ));
    return response;
  }

  Future<Response> postRequestFormData({
    required String Endpoint , Map<String, dynamic>? headers , Map<String, dynamic>? body
  }) async {
    var response = await dio.post(
        Endpoint,
        data: FormData.fromMap(body!) ,

        options: Options(

            headers: headers
        ));
    return response;
  }





//   Future<Result<SignUpResponse>> CreateAccount({
//     required String name , required String email , required String phone , required String password,
//     required String rePassword
// })async{
//     try{
//
//       var response = await dio.post(Endpoint.SignUpEndpoint,data: {});
//       if(response.statusCode?.isSuccessRequest == true){
//         var signUpResponse = SignUpResponse.fromJson(response.data);
//         return Success(data : SignUpResponse);
//       }else{
//         var errorResponse = ErrorResponse..fromJson(response.data);
//         return ServerError(serverException : ServerException(statusMsg : errorResponse.statusMsg ??'' , message : errorResponse.message?? '' ));
//       }
//
//
//     }on Exception catch(ex){
//          return Error(exception : ex);
//     }
//
//   }
}*/
