import 'package:blog_system_app/view/Screens/Main_Screens/Articles/article_screen.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/Articles/article_single_screen.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/Articles/article_write_screen.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/Home/home_page.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/profile_screen.dart';
import 'package:blog_system_app/view/Screens/StartScreens/onbordingScreen/onboarding_screen.dart';
import 'package:blog_system_app/view/Screens/StartScreens/splash_screen.dart';
import 'package:blog_system_app/view/Screens/register&Login/login_screen.dart';
import 'package:blog_system_app/controller/RouteManagment/routs_name.dart';
import 'package:flutter/material.dart';



class Routs {
  Routs._();

  static Map<String, Widget Function(BuildContext)> routesScreen = {

    RoutsName.routeSplashScreen: (context)=> const SplashScreen(),
    RoutsName.routeHomeScreen: (context)=>  HomePage(),
    RoutsName.routeArticlesList: (context)=>  ArticleScreen(),
    RoutsName.routeArticlesWrite: (context)=> const ArticleWriteScreen(),
    RoutsName.routeArticlesSingle: (context)=>  ArticleSingleScreen(),
    RoutsName.routeProfileScreen: (context)=>  ProfileScreen(),
    RoutsName.routeLoginScreen: (context)=>  const LoginScreen(),
    RoutsName.routeOnbordingScreen: (context)=>  const OnboardingScreen(),
    

  };
}
