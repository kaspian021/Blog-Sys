
import 'package:blog_system_app/controller/Animation_controller/Home_Screen_animation/drawer_animation_home.dart';
import 'package:blog_system_app/controller/Main_Screens/home_controller.dart';
import 'package:blog_system_app/controller/Register/check_login_controller.dart';
import 'package:blog_system_app/gen/assets.gen.dart';
import 'package:blog_system_app/controller/RouteManagment/routs_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerBlogSys extends StatefulWidget {
  const DrawerBlogSys({super.key, required this.textstyle});

  final TextTheme textstyle;

  @override
  State<DrawerBlogSys> createState() => _DrawerBlogSysState();
}

class _DrawerBlogSysState extends State<DrawerBlogSys>
    with TickerProviderStateMixin {
  //Controller_Getx
  final controller = Get.find<HomeController>();
  final logincontroller = Get.find<CheckLoginController>();
  bool chengeWidgetLoginIcon = false;

  @override
  void initState() {
    //animationController
    DrawerAnimationHome.animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    DrawerAnimationHome
        .animationControllerInitStartDrawer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    );

    //AnimationsWidgetDrawer
    DrawerAnimationHome.animationLoginIcon = Tween<double>(
      begin: 100,
      end: 2,
    ).animate(
      CurvedAnimation(
        parent: DrawerAnimationHome.animationController,
        curve: Curves.elasticInOut,
      ),
    );

    DrawerAnimationHome.animationLoginBig = Tween<double>(
      begin: 1,
      end: 1.7,
    ).animate(
      CurvedAnimation(
        parent: DrawerAnimationHome.animationController,
        curve: Curves.elasticInOut,
      ),
    );
    DrawerAnimationHome.animationStartLogoDrawer = Tween<Offset>(
      begin: const Offset(-.4, -2),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: DrawerAnimationHome.animationControllerInitStartDrawer,
        curve: Curves.elasticInOut,
      ),
    );
    DrawerAnimationHome.animationStartWidget = Tween<Offset>(
      begin: const Offset(2, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: DrawerAnimationHome.animationControllerInitStartDrawer,
        curve: Curves.elasticInOut,
      ),
    );
    DrawerAnimationHome.animationControllerInitStartDrawer.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: AnimatedBuilder(
        builder: (BuildContext inercontext, widgetState) {
          return Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      if (logincontroller.isLogin.value) {
                        Get.toNamed(RoutsName.routeProfileScreen);
                      } else {
                        DrawerAnimationHome.animationController.forward();
                        chengeWidgetLoginIcon = true;
                      }
                    },
                    child: ScaleTransition(
                      scale: DrawerAnimationHome.animationLoginBig,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            DrawerAnimationHome.animationLoginIcon.value,
                          ),
                          border: Border.all(color: Colors.blue, width: 1),
                          boxShadow: const [
                            BoxShadow(color: Colors.white, blurRadius: 2),
                          ],
                          // image: DecorationImage(image: ) image Profile person
                        ),
                        child:
                            !chengeWidgetLoginIcon
                                ?  
                                   const Icon(
                                    Icons.person,
                                    color: Colors.black,
                                    size: 40,
                                  
                                )
                                : GestureDetector(
                                  onTap:
                                      () => Get.toNamed(
                                        RoutsName.routeLoginScreen,
                                      ),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: DrawerAnimationHome.animationStartLogoDrawer,
                    child: Image.asset(
                      Assets.images.logoBlog.path,
                      scale: 2.6,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 80),
              SlideTransition(
                position: DrawerAnimationHome.animationStartWidget,
                child: Container(
                  width: Get.width / 2.1,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(color: Colors.white, blurRadius: 10),
                    ],
                    border: Border.all(
                      color: Colors.blue,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      const Icon(Icons.person, size: 35),
                      const SizedBox(width: 5),
                      Text('Support', style: widget.textstyle.bodyLarge),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.blueAccent,
                endIndent: 40,
                indent: 40,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  //TODO share plus
                },
                child: SlideTransition(
                  position: DrawerAnimationHome.animationStartWidget,
                  child: Container(
                    width: Get.width / 2.1,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(color: Colors.white, blurRadius: 10),
                      ],
                      border: Border.all(
                        color: Colors.blue,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(child: Text('Github', style: widget.textstyle.bodyLarge)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.blueAccent,
                endIndent: 40,
                indent: 40,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  //TODO share plus
                },
                child: SlideTransition(
                  position: DrawerAnimationHome.animationStartWidget,
                  child: Container(
                    width: Get.width / 2.1,
                    height: 40,
                  
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(color: Colors.white, blurRadius: 10),
                      ],
                      border: Border.all(
                        color: Colors.blue,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        const Icon(Icons.telegram, size: 35),
                        const SizedBox(width: 5),
                        Text('Telegram', style: widget.textstyle.bodyLarge),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        animation: DrawerAnimationHome.animationController,
      ),
    );
  }

  @override
  void dispose() {
    DrawerAnimationHome.animationController.dispose();
    DrawerAnimationHome.animationControllerInitStartDrawer.dispose();

    super.dispose();
  }
}
