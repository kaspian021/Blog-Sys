
import 'package:blog_system_app/component/extension_app.dart';
import 'package:blog_system_app/component/value_sizes.dart';
import 'package:blog_system_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class SelectRegister extends StatefulWidget {
  const SelectRegister({super.key});

  @override
  State<SelectRegister> createState() => _SelectRegisterState();
}

class _SelectRegisterState extends State<SelectRegister>
    with SingleTickerProviderStateMixin {

  //controll_Screen    
  bool loginSelect = true;
  bool signUpSelect = false;

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

    final Size size = MediaQuery.of(context).size;

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
                height: size.height / 1.2,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 24, 27, 211),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    ValueSizes.medium.height,
                    //select_login||signUP
                    Padding(
                      padding: const EdgeInsets.all(ValueSizes.veryMedium),
                      child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    
                                      if (!loginSelect &&
                                          signUpSelect) {
                                        loginSelect =
                                            true;
                                        signUpSelect =
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
                                          loginSelect
                                              ? Colors.white
                                              : Colors.white30,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    
                                      if (!signUpSelect &&
                                          loginSelect) {
                                        
                                        signUpSelect =
                                            true;
                                        loginSelect =
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
                                          signUpSelect
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
                                indent: size.width / 2.7,
                                endIndent: size.width / 2.7,
                              ),
                            ),
                          ],
                        
                      ),
                    ),
                    ValueSizes.medium.height,
                    //login_screen|| SignUpScreen
                    // Obx(
                    //   () =>
                    //       loginSelect
                    //           ? const LoginScreen()
                    //           : const SignUpScreen(),
                    // ),
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
