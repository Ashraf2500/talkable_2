import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../utils/strings_manager.dart';
@singleton
class ApiManager {
  Dio dio = Dio(
      BaseOptions(
          baseUrl: StringsManager.baseUrl,
          validateStatus: (status){
            if((status!>=200&& status<300)||status == 400||status==401)
              {
                return true;
              }
            return false;
        }

      )

  )..interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 90,
    enabled: kDebugMode,
  ));

  Future<Response> getRequest({
    required String Endpoint,
    Map<String, dynamic>? queryparam,
    Map<String, dynamic>? headers}) async
  {
    var response = await dio.get(
        Endpoint, queryParameters: queryparam, options: Options(
        headers: headers
    ));
    return response;
  }

  Future<Response> postRequest({
    required String Endpoint, Map<String, dynamic>? headers, Map<String,
        dynamic>? body
  }) async {
    var response = await dio.post(
        Endpoint,
        data: body,

        options: Options(

            headers: headers
        ));
    return response;
  }

  Future<Response> postRequestFormData({
    required String Endpoint, Map<String, dynamic>? headers, Map<String,
        dynamic>? body
  }) async {
    var response = await dio.post(
        Endpoint,
        data: FormData.fromMap(body!),

        options: Options(

            headers: headers
        ));
    return response;
  }

}