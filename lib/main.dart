
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
      
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateColor.resolveWith((callback) {
              if (callback.contains(WidgetState.pressed)) {
                return Colors.black;
              }
              return Colors.blue;
            }),
            animationDuration: const Duration(seconds: 1),
            shape: WidgetStatePropertyAll(
              ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            
          ),
        ),
        
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 22,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 18,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w300,
            color: Colors.black,
            fontSize: 12,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Avenir',
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 16,
            ),
            titleMedium: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w300,
              color: Colors.black,
              fontSize: 16,
            ),
            headlineMedium: TextStyle(
              fontFamily: 'Avenir',
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 18
            ),
          ),
        ),
      
    );
  }
}
