
import 'package:blog_system_app/component/extension_app.dart';
import 'package:blog_system_app/component/text_style_app.dart';
import 'package:blog_system_app/component/value_sizes.dart';
import 'package:blog_system_app/component/widget_custom.dart';
import 'package:blog_system_app/controller/Animation_controller/registerAnimation/login_animation_screen.dart';
import 'package:blog_system_app/controller/Register/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key,});



  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<LoginController>();
  @override
  void initState() {
    //animationController
    LoginAnimationScreen.animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    LoginAnimationScreen.animationContainerLogin = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: LoginAnimationScreen.animationController,
        curve: Curves.elasticInOut,
      ),
    );

    LoginAnimationScreen.animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return Expanded(
      child: SlideTransition(
        position: LoginAnimationScreen.animationContainerLogin,
        child: Container(
          width: double.infinity,
          height: Get.height / 2.16,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: AnimatedBuilder(
              builder: (context, widgets) {
                return Obx(
                  () => Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Welcome back',
                          style: LightTextStyleApp.textTitleLarge,
                        ),
                      ),
                      ValueSizes.low.height,
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sign in with your account',
                          style: LightTextStyleApp.textNamesSmall,
                        ),
                      ),
                      (ValueSizes.high+1).height,
                      //Email
                      Obx(
                        ()=> AppTextField(
                          controller: controller,
                          controllerTextEditing: controller.textEmailEditingController,
                          position: 'Email',
                          icon:
                              controller.isEmailOk.value
                                    ? const Icon(Icons.check, color: Colors.green)
                                    : const Icon(Icons.email),
                                  
                        ),
                      ),
                      (ValueSizes.veryhigh+15).height,
                      //password
                      TextField(
                        onChanged: (value) {
                          if (value.isPassport) {
                            controller.isPassportOk.value = true;
                          } else {
                            controller.isPassportOk.value = false;
                          }
                        },

                        obscureText: controller.obscureTextBool.value,
                        style: LightTextStyleApp.textNamesSmall,
                        cursorHeight: 18,
                        cursorWidth: 1,
                        expands: false,
                        controller: controller.textPasswordUPEditingController,
                        decoration: InputDecoration(
                          icon:
                              controller.isPassportOk.value
                                  ? const Icon(Icons.check, color: Colors.green)
                                  : const Icon(Icons.lock),
                          labelStyle: LightTextStyleApp.textLableandTitleTextStyle,
                          label: const Text('Password'),
                          fillColor: Colors.black,
                          hoverColor: Colors.black,
                          contentPadding: const EdgeInsets.only(left: 2),
                          hintFadeDuration: const Duration(seconds: 1),

                          suffixIcon: InkWell(
                            onTap: () {
                              controller.obscureTextBool.value
                                  ? controller.obscureTextBool.value = false
                                  : controller.obscureTextBool.value = true;
                            },
                            child: Text(
                              controller.obscureTextBool.value
                                  ? 'show'
                                  : 'Hide',
                                  style: LightTextStyleApp.textLableandTitleTextStyle,
                            ),
                          ),
                        ),
                      ),
                      (ValueSizes.veryhigh+10).height,
                      ElevatedButton(
                        onPressed: () {
                          if (controller.isEmailOk.value) {
                            //create_account
                            controller.signIngFirbaseWithEmailAndPassword();
                          } else {
                            Get.snackbar('Error', 'email nothing');
                          }
                        },
                        child: const Text(
                          'LOGIN',
                          style: LightTextStyleApp.textLableandTitleWhiteTextStyle,
                        ),
                      ),
                      (ValueSizes.veryhigh+20).height,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Forgot your password?',
                                  style: LightTextStyleApp.textLableandTitleTextStyle,),
                          SizedBox(width: 5),
                          Text('Reset here',
                                  style: LightTextStyleApp.textLableandTitleTextStyle,),
                        ],
                      ),
                      ValueSizes.veryhigh.height,
                      const Text('Or sign in with',

                        style: LightTextStyleApp.textLableandTitleTextStyle,
                      
                      ),
                    ],
                  ),
                );
              },
              animation: LoginAnimationScreen.animationController,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    LoginAnimationScreen.animationController.dispose();
    super.deactivate();
  }
}
