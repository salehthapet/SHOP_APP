// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:dio/dio.dart';
import 'package:untitled6/shared/network/local/shared_preference.dart';

class cacheHelper {
  static  late   Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
         receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getdata(
      {
        required url,
        Map<String,
            dynamic>? query,
        String lang = 'ar',
        String? token ,

      }) async {
    dio.options.headers= {

      'Content-Type':'application/json' ,
      'lang'  :lang,
      'Authorization' : cachehelper1.getstring('token') ,
    };
    return await dio.get(url, queryParameters: query);
  }
  static Future<Response> Postdata({
    required url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> Data,
    String lang = 'ar',
    String? token ,
  }) async {
    dio.options.headers= {
      'Content-Type':'application/json' ,
      'lang'  :lang,
      'Authorization' : cachehelper1.getstring('token') ,

    };
    return  await  dio.post(url, queryParameters: query, data: Data);

  }
}