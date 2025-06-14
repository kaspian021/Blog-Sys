
import 'package:blog_system_app/component/elements.dart';
import 'package:blog_system_app/component/service.dart';
import 'package:blog_system_app/view/Screens/StartScreens/onbordingScreen/onboarding_screen.dart';
import 'package:blog_system_app/controller/RouteManagment/routs_name.dart';
import 'package:get/get.dart';

class CheckLoginController extends GetxController {

  RxBool isLogin= false.obs;


    Future<void> checkedLogin()async{

    if(await WidgetsAndVariableStatic.box.read(SaveToken.token)!=null){
      Get.offAndToNamed(RoutsName.routeHomeScreen);
      isLogin.value=true;
      
    }else{
      Get.off(const OnboardingScreen());
      isLogin.value=false;
    }
    
  }

}