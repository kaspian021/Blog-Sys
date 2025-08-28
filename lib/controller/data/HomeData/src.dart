import 'dart:developer';

import 'package:blog_system_app/model/model_home_data.dart';
import 'package:dio/dio.dart';

abstract class IDataSourceHomeData {
  Future<ModelHomeData?> homePage();
}

class SrcHomeData implements IDataSourceHomeData{

  final Dio _dio = Dio();

  SrcHomeData(){
    
    
    _dio.options= BaseOptions(
      baseUrl: '',
      connectTimeout: const Duration(seconds: 20),
      contentType: 'application_Json',
      

    );
  }

  @override
  Future<ModelHomeData?> homePage()async {
    try {
      var response= await _dio.get('/homePage');
      if(response.statusCode==200){
        return ModelHomeData.fromJson(response.data);
      }
      return null;
    } catch (e) {
      log('Error SrcHomeData: homePage: $e');
      return null;
    }
    
  }

}

//TODO بعدا باید افلاین دیتا سورس رو هم پیاده سازی کنی
