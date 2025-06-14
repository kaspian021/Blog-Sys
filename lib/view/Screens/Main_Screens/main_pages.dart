
import 'package:blog_system_app/component/elements.dart';
import 'package:blog_system_app/component/temps.dart';
import 'package:blog_system_app/component/value_sizes.dart';
import 'package:blog_system_app/controller/Main_Screens/home_controller.dart';
import 'package:blog_system_app/controller/Register/check_login_controller.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/Articles/article_screen.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/Articles/article_write_screen.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/Home/drawer_widget.dart';
import 'package:blog_system_app/view/Screens/Main_Screens/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MainPages extends StatelessWidget {
  MainPages({super.key});

  

  final logincontroller = Get.find<CheckLoginController>();
  final controller = Get.find<HomeController>();

  final GlobalKey<ScaffoldState> _keyGlobal = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var textstyle = Theme.of(context).textTheme;
    var sizeBody = MediaQuery.of(context).size.width / 12;
    return SafeArea(
      child: Scaffold(
        drawerEdgeDragWidth: ValueSizes.veryhigh,
        key: _keyGlobal,
        drawerEnableOpenDragGesture: false,
        endDrawerEnableOpenDragGesture: true,
        
        drawerScrimColor: Colors.black,
        //Drawer programm
        endDrawer: DrawerBlogSys(textstyle: textstyle),

        //bottomNavigationBar
        bottomNavigationBar: BottomNavigationBlogSys(
          controller: controller,
          loginController: logincontroller,
          keyGlobal: _keyGlobal,
        ),

        body: Obx(
          () => IndexedStack(
            index: controller.colorIcon.value,

            children: [
              HomePage(
                sizeBody: sizeBody,
                controller: controller,
                box: WidgetsAndVariableStatic.box,
                textstyle: textstyle,
              ),
              ArticleScreen(),
              const ArticleWriteScreen()
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BottomNavigationBlogSys extends StatelessWidget {
  const BottomNavigationBlogSys({
    super.key,
    required GlobalKey<ScaffoldState> keyGlobal,
    required this.controller,
    required this.loginController,
  }) : _keyGlobal = keyGlobal;

  final HomeController controller;
  final CheckLoginController loginController;
  final GlobalKey<ScaffoldState> _keyGlobal;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: Get.height / 9.90,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: ValueSizes.medium)],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    controller.colorIcon.value = 0;
                  },
                  icon: Icon(
                    Icons.home_sharp,
                    size: 30,
                    color:
                        controller.colorIcon.value == 0
                            ? Colors.blue
                            : Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.colorIcon.value = 1;
                  },
                  icon: Icon(
                    Icons.article_rounded,
                    size: 30,
                    color:
                        controller.colorIcon.value == 1
                            ? Colors.blue
                            : Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //if user islogin==true and isSeller => to write ArticleScreen

                    if (loginController.isLogin.value && controller.isSeller.value) {
                      controller.colorIcon.value=2;
                    } else {
                      //to details permissionsScreen
                      Get.snackbar(
                        'Error',
                        'You need permissions to enter this section.',
                        colorText: Colors.red,
                        mainButton: TextButton(
                          onPressed: () {

                            //permissionsScreen
                            
                          },
                          child: const Text('see more details'),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: Get.height / ValueSizes.high,
                    width: Get.height / ValueSizes.high,
                    decoration: BoxDecoration(
                      color: controller.isSeller.value? ColorsConst.colorPrimery: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child:  controller.isSeller.value? const Icon(Icons.add, size: 35, color:  Colors.white):const Icon(Icons.close, size: 35, color:  Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.colorIcon.value = 3;
                  },
                  icon: Icon(
                    Icons.search_rounded,
                    size: 30,
                    color:
                        controller.colorIcon.value == 3
                            ? Colors.blue
                            : Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    
                    _keyGlobal.currentState!.openEndDrawer();
                  },
                  icon: const Icon(Icons.menu, size: 30, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
