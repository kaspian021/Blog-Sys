
import 'dart:developer';



import 'package:blog_system_app/component/get_names_url.dart';
import 'package:blog_system_app/component/service.dart';
import 'package:blog_system_app/model/model_home_new_articles.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt colorIcon= 0.obs;
  RxBool isloading= false.obs;
  
  RxBool isSeller= false.obs;
  
  RxList<ModelHomeNewArticles> listArticlesNews= RxList();

  Iterable<ModelHomeNewArticles> listArticlesTopVisited=const Iterable.empty();

  @override
  void onInit() {
    newsArticlesList();
    super.onInit();
  }

  newsArticlesList()async{
    isloading.value= true;
    try {
      final response= await  ServiceApi().getApi(GetNamesUrl.newsArticlesURl);

      if(response.statusCode==200){

      for(var element in response.data){
        listArticlesNews.add(ModelHomeNewArticles.fromJson(element));

        
        log(listArticlesNews[0].image!);
      }
      listArticlesTopVisited= listArticlesNews.where((hop)=> hop.view! >= 2000).toList();
      isloading.value= false;
    }
    } on DioException catch (e) {
      log('Error: ${e.error}');
      Get.snackbar('Error', 'connection Lost');
    }
    
  }



}