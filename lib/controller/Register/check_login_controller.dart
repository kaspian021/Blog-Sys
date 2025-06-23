import 'package:blog_system_app/component/elements.dart';
import 'package:blog_system_app/component/service.dart';
import 'package:blog_system_app/controller/RouteManagment/routs_name.dart';
import 'package:flutter/widgets.dart';


class CheckLoginController{

    CheckLoginController._();

    static bool isLogin= false;

    static Future<void> checkedLogin(context)async{

    if(await WidgetsAndVariableStatic.box.read(SaveToken.token)!=null){
      Navigator.pushNamed(context, RoutsName.routeHomeScreen);
      isLogin=true;
      
    }else{
      Navigator.pushReplacementNamed(context, RoutsName.routeOnbordingScreen);
      isLogin=false;
    }
    
  }

}