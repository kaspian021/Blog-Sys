
import 'package:blog_system_app/controller/Main_Screens/article_controller.dart';
import 'package:blog_system_app/controller/Main_Screens/home_controller.dart';
import 'package:blog_system_app/controller/Main_Screens/profile_controller.dart';
import 'package:blog_system_app/controller/Register/check_login_controller.dart';
import 'package:blog_system_app/controller/Register/login_controller.dart';
import 'package:get/get.dart';

class BindLoginScreen implements Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.lazyPut(() => CheckLoginController(),);
    
  }
}

class BindHomeScreen implements Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(ArticleController());
    Get.lazyPut(() => CheckLoginController(),);
    
  }
}

class BindArticleScreen implements Bindings{
  @override
  void dependencies() {
    
    Get.put(ArticleController());
    
  }
}

class BindProfileScreen implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(ProfileController());
  }


}
