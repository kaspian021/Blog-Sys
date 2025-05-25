import 'package:dio/dio.dart';

class SaveToken {
  SaveToken._();
  //save Specifications users
  static String token = 'token';
  static String userName = 'username';
  static String email = 'Email';
  static String nameBisines= 'nameBisines';
}

class ServiceApi {
  final dio = Dio();
  //Get Method for request in programme
  Future<dynamic> getApi(String url) async {
    return await dio.get(
          url,
          options: Options(responseType: ResponseType.json, method: "GET"),
        ).then((respons) {
          return respons;
        });
  }
  
}
