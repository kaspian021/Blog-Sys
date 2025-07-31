
import 'package:blog_system_app/component/extension_app.dart';
import 'package:blog_system_app/component/text_style_app.dart';
import 'package:blog_system_app/component/value_sizes.dart';
import 'package:blog_system_app/controller/Animation_controller/Home_Screen_animation/drawer_animation_home.dart';
import 'package:blog_system_app/gen/assets.gen.dart';
import 'package:blog_system_app/controller/RouteManagment/routs_name.dart';
import 'package:flutter/material.dart';


class DrawerBlogSys extends StatefulWidget {
  const DrawerBlogSys({super.key});

 

  @override
  State<DrawerBlogSys> createState() => _DrawerBlogSysState();
}

class _DrawerBlogSysState extends State<DrawerBlogSys>
    with TickerProviderStateMixin {
  //Controller_Getx
  final controller = Get.find<HomeController>();

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
    var size = MediaQuery.of(context).size;
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
                      if (CheckLoginController.isLogin) {
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
                                    style: LightTextStyleApp.textLoginTextStyle
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
                  width: size.width / 2.1,
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
                  child: const Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(Icons.person, size: 35),
                      SizedBox(width: 5),
                      Text('Support', style: LightTextStyleApp.textTitleLarge),
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
                    width: size.width / 2.1,
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
                    child: const Center(child: Text('Github', style: LightTextStyleApp.textTitleLarge)),
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
                    width: size.width / 2.1,
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
                    child:  Row(
                      children: [
                        ValueSizes.veryhigh.width,
                        const Icon(Icons.telegram, size: 35),
                        ValueSizes.verylow.width,
                        const Text('Telegram', style: LightTextStyleApp.textTitleLarge),
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
