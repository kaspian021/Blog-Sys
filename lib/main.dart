
import 'package:blog_system_app/component/temps.dart';
import 'package:blog_system_app/controller/Register/login_controller.dart';
import 'package:blog_system_app/view/route_Screen/routs.dart';
import 'package:blog_system_app/view/route_Screen/routs_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return GetMaterialApp(
      getPages: Routs.routs,
      debugShowCheckedModeBanner: false,
      initialRoute: RoutsName.routeSplashScreen,
      
      theme: dataTheme()
      
    );
  }
}
