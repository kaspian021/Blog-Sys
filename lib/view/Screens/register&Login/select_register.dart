
import 'package:blog_system_app/controller/Register/login_controller.dart';
import 'package:blog_system_app/controller/Register/register_controller.dart';
import 'package:blog_system_app/gen/assets.gen.dart';
import 'package:blog_system_app/view/Screens/register&Login/login_screen.dart';
import 'package:blog_system_app/view/Screens/register&Login/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SelectRegister extends StatefulWidget {
  const SelectRegister({super.key});

  @override
  State<SelectRegister> createState() => _SelectRegisterState();
}

class _SelectRegisterState extends State<SelectRegister>
    with SingleTickerProviderStateMixin {

  //controll_Screen    
  RxBool loginSelect = true.obs;
  RxBool signUpSelect = false.obs;

  //Controller_Register
  
  //dividerAniamtion
  late AnimationController controller;
  late Animation<Offset> animationDivider;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animationDivider = Tween<Offset>(
      begin: const Offset(-.2, 0),
      end: const Offset(.18, 0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.elasticInOut));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 50),
              Image.asset(Assets.images.logoBlog.path, scale: 2.5), //Image_Logo
              const SizedBox(height: 30),
              //container_Login
              Container(
                height: Get.height / 1.2,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 24, 27, 211),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    //select_login||signUP
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Obx(
                        () => Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    
                                      if (!loginSelect.value &&
                                          signUpSelect.value) {
                                        loginSelect.value =
                                            true;
                                        signUpSelect.value =
                                            false;
                                            controller.reverse();
                                      }
                                      
                                    
                                  },

                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w700,
                                      color:
                                          loginSelect.value
                                              ? Colors.white
                                              : Colors.white30,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    
                                      if (!signUpSelect.value &&
                                          loginSelect.value) {
                                        
                                        signUpSelect.value =
                                            true;
                                        loginSelect.value =
                                            false;
                                            controller.forward();
                                      }
                                      
                                    
                                  },
                                  child: Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w700,
                                      color:
                                          signUpSelect.value
                                              ? Colors.white
                                              : Colors.white30,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SlideTransition(
                              position: animationDivider,
                              child: Divider(
                                thickness: 2,
                                color: Colors.white,
                                indent: Get.width / 2.7,
                                endIndent: Get.width / 2.7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //login_screen|| SignUpScreen
                    Obx(
                      () =>
                          loginSelect.value
                              ? LoginScreen(textStyle: textStyle)
                              : SignUpScreen(textStyle: textStyle),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
