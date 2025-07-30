import 'package:blog_system_app/component/temps.dart';

import 'package:blog_system_app/controller/RouteManagment/routs_name.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/main_pages.dart';
import 'package:blog_system_app/view/Screens/StartScreens/onbordingScreen/onboarding_screen.dart';
import 'package:blog_system_app/view/Screens/register&Login/cubit/authapp_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => AuthappCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutsName.routeSplashScreen,
        home: BlocBuilder<AuthappCubit,AuthappState>(builder: (context, state) {
          if(state is LoadedState){
            return const MainPages();
          }else if(state is LogoutState){
            return const OnboardingScreen();

          }else{
            return const MainPages();
          }
        },),
        theme: dataTheme(),
      ),
    );
  }
}
