import 'dart:developer';


import 'package:blog_system_app/component/get_names_url.dart';
import 'package:blog_system_app/component/service.dart';
import 'package:blog_system_app/model/model_articles_single.dart';
import 'package:get/get.dart';

class ArticleController extends GetxController {
 

  
  Rx<ModelArticlesSingle> contentArticleSingle= ModelArticlesSingle().obs;

  RxBool isloading = false.obs;

  


  showArticleSingle(String id) async {
    try {
      isloading.value = true;

      final String url = '${GetNamesUrl.baseUrl}article/get.php?command=info&id=$id&user_id=1';

      final response = await ServiceApi().getApi(url);

      if (response.statusCode == 200) {
        contentArticleSingle.value= ModelArticlesSingle.fromJson(response.data);
        log('ok article Content');
        isloading.value = false;
      }
      
    } catch (e) {
      Get.snackbar('Error', 'connection Lost');
      log('error: $e');
    }
  }
}
