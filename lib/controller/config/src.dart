import 'dart:developer';
import 'package:blog_system_app/controller/database/database_articles.dart';
import 'package:blog_system_app/model/model_articles.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class IDataSource{
  Future<List<ModelArticles>> getProductAll();
  Future<List<ModelArticles>> getProdoctShowBest();
  Future<ModelArticles?> getProdoctById(int id);
  
}

class DataSource implements IDataSource{

  final Dio _dio = Dio();

  DataSource(){
    
    
    _dio.options= BaseOptions(
      baseUrl: '',
      connectTimeout: const Duration(seconds: 20),
      contentType: 'application_Json',
      

    );
  }

  @override
  Future<ModelArticles?> getProdoctById(int id)async {
      final ModelArticles modelArticles;
      
      bool statusInternet = await InternetConnection().hasInternetAccess;
      final database = DatabaseArticles.instance;
      if(statusInternet){
        try {
          
          var response = await _dio.get('/product/product_show/$id');
          if(response.statusCode==200){
            modelArticles = ModelArticles.fromJson(response.data['data']);
            return modelArticles;
          }
          return null;
        } catch (e) {
          log('Error Src: getArticlesAll: $e');
          return null;
        }
      }else{
        return await database.getArticlebyId(id);
      }
    
    
    
  }

  @override
  Future<List<ModelArticles>> getProdoctShowBest()async {
    List<ModelArticles> modelArticles= List.empty();
      bool statusInternet = await InternetConnection().hasInternetAccess;
      final database = DatabaseArticles.instance;
      if(statusInternet){
        try {
          var response = await _dio.get('/product/show_best_product');
          if(response.statusCode==200){
            for(var item in response.data['data']['all_product']){
              modelArticles.add(ModelArticles.fromJson(item));

            }
            return modelArticles;
          }
          return List.empty();
        } catch (e) {
          log('Error Src: getArticlesAll: $e');
          return List.empty();
        }
      }else{
        return await database.getArticleBylike();
      }
  }

  @override
  Future<List<ModelArticles>> getProductAll()async {
      List<ModelArticles> modelArticles= List.empty();
      bool statusInternet = await InternetConnection().hasInternetAccess;
      final database = DatabaseArticles.instance;
      if(statusInternet){
        try {
          var response = await _dio.get('/product/show_all_product');
          if(response.statusCode==200){
            for(var item in response.data['data']['all_product']){
              modelArticles.add(ModelArticles.fromJson(item));

            }

            await database.setArticlesAll(modelArticles);
            return modelArticles;
          }
          return List.empty();
        } catch (e) {
          log('Error Src: getArticlesAll: $e');
          return List.empty();
        }
      }else{
        return await database.getArticlesAll();
      }
  }


}