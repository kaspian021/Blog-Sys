
import 'package:blog_system_app/component/extension_app.dart';
import 'package:blog_system_app/component/value_sizes.dart';
import 'package:blog_system_app/controller/Animation_controller/registerAnimation/login_animation_screen.dart';
import 'package:blog_system_app/controller/Register/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.textStyle});

  final TextTheme textStyle;

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
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Welcome back',
                          style: widget.textStyle.bodyLarge,
                        ),
                      ),
                      ValueSizes.low.height,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sign in with your account',
                          style: widget.textStyle.bodySmall,
                        ),
                      ),
                      (ValueSizes.high+1).height,
                      //Email
                      TextField(
                        onChanged: (value) {
                          if (value.isEmail) {
                            controller.isEmailOk.value = true;
                          } else {
                            controller.isEmailOk.value = false;
                          }
                        },
                        style: widget.textStyle.titleSmall,
                        cursorHeight: 18,
                        cursorWidth: 1,
                        expands: false,
                        controller: controller.textEmailEditingController,
                        decoration: InputDecoration(
                          icon:
                              controller.isEmailOk.value
                                  ? const Icon(Icons.check, color: Colors.green)
                                  : const Icon(Icons.email),
                          labelStyle: widget.textStyle.titleMedium,
                          label: const Text('Email'),
                          fillColor: Colors.black,
                          hoverColor: Colors.black,
                          contentPadding: const EdgeInsets.only(left: 2),
                          hintFadeDuration: const Duration(seconds: 1),
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
                        style: widget.textStyle.titleSmall,
                        cursorHeight: 18,
                        cursorWidth: 1,
                        expands: false,
                        controller: controller.textPasswordUPEditingController,
                        decoration: InputDecoration(
                          icon:
                              controller.isPassportOk.value
                                  ? const Icon(Icons.check, color: Colors.green)
                                  : const Icon(Icons.lock),
                          labelStyle: widget.textStyle.titleMedium,
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
                                  style: widget.textStyle.titleMedium,
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
                        child: Text(
                          'LOGIN',
                          style: widget.textStyle.titleLarge,
                        ),
                      ),
                      (ValueSizes.veryhigh+20).height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Forgot your password?',
                                  style: widget.textStyle.titleMedium,),
                          const SizedBox(width: 5),
                          Text('Reset here',
                                  style: widget.textStyle.titleMedium,),
                        ],
                      ),
                      ValueSizes.veryhigh.height,
                      const Text('Or sign in with'),
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
