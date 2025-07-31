import 'dart:developer';

import 'package:blog_system_app/model/model_articles_single.dart';
import 'package:blog_system_app/model/model_home_new_articles.dart';
import 'package:blog_system_app/model/model_result.dart';
import 'package:blog_system_app/service/get_names_url.dart';
import 'package:blog_system_app/service/service_tools.dart';
import 'package:dio/dio.dart';

class Apiservice {

  var dio = Dio();

  Apiservice(){

    dio.options.baseUrl= GetNamesUrl.baseUrl;
    dio.options.connectTimeout= const Duration(seconds: 30);
    dio.options.contentType = 'application/json';
    dio.options.headers= {
      'Authentication': 'Bearer ${SaveToken.token}',
      'Accept': 'application/json',
    };

  }

  Future<ModelHomeNewArticles?> showHomeNewArticles() async{

    try {
      final String url = 'article';
      final response = await dio.get(url);
      if(response.statusCode == 200){
        for(var item in response.data){
          return ModelHomeNewArticles.fromJson(item);
        }
        log('showHomeNewArticles: ok data to in Model');
      }else{
        log('showHomeNewArticles: not ok data');
        return ModelHomeNewArticles(title: '', image: '', view: 0, createdAt: '', author: '', id: '', content: '');
      }

    } catch (e) {
      log('showHomeNewArticles: Error: $e');
      return ModelHomeNewArticles(title: '', image: '', view: 0, createdAt: '', author: '', id: '', content: '');
    }

  }

  Future<ModelArticlesSingle> showArticleSingle(String id) async {
    try {
      

      final String url = 'article/get.php?command=info&id=$id&user_id=1';

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        log('ok article Content');
        return ModelArticlesSingle.fromJson(response.data);
        
        
      }else {
        log('error: ${response.statusCode}');
        return ModelArticlesSingle();
      }
      
    } catch (e) {
      log('error: $e');
      return ModelArticlesSingle();
      
    }
  }
  

}