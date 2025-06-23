
import 'package:blog_system_app/controller/Register/check_login_controller.dart';
import 'package:blog_system_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{



  //animationController
  late AnimationController controller;
  late Animation<double> animationLogo;

    @override
  void initState() {
    controller= AnimationController(vsync: this,duration: const Duration(seconds: 1));

    animationLogo = Tween<double>(begin: .8, end:.7 ).animate(controller);

    controller.repeat();

    Future.delayed(const Duration(seconds: 3)).then((onValue)async{

      await CheckLoginController.checkedLogin(context);
      
      

    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
    
          children: [
            const SizedBox(height: 10),
            ScaleTransition(scale: animationLogo,
            child: Center(child: Image.asset(Assets.images.logoBlog.path,height: 60,))),
    
            const Align(
              alignment: Alignment.bottomCenter,
              child: SpinKitThreeInOut(color: Colors.blue, size: 20),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}