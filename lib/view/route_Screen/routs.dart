
import 'package:blog_system_app/controller/bindings.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/Articles/article_screen.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/Articles/article_single_screen.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/main_pages.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/profile_screen.dart';
import 'package:blog_system_app/view/Screens/StartScreens/splash_screen.dart';
import 'package:blog_system_app/view/Screens/register&Login/select_register.dart';
import 'package:blog_system_app/view/route_Screen/routs_name.dart';
import 'package:get/get.dart';

//Screens_for_simple_binding


class Routs {
  Routs._();

  static List<GetPage<dynamic>> routs = [
    GetPage(
      name: RoutsName.routeLoginScreen,
      page: () => const SelectRegister(),
      binding: BindLoginScreen(),
    ),
    
    GetPage(
      name: RoutsName.routeSplashScreen,
      page: () => const SplashScreen(),
      binding: BindLoginScreen(),
    ),
    GetPage(
      name: RoutsName.routeHomeScreen,
      page: () =>   MainPages(),
      binding: BindHomeScreen(),
    ),
    GetPage(
      name: RoutsName.routeProfileScreen,
      page: () =>  ProfileScreen(),
      binding: BindProfileScreen(),
    ),
    GetPage(
      name: RoutsName.routeArticlesList,
      page: () =>  ArticleScreen(),
      binding: BindArticleScreen(),
    ),
    GetPage(
      name: RoutsName.routeArticlesSingle,
      page: () =>  ArticleSingleScreen(),
      binding: BindArticleScreen(),
    ),
  ];
}
