import 'package:blog_system_app/component/extension_app.dart';
import 'package:blog_system_app/component/text_style_app.dart';
import 'package:blog_system_app/component/value_sizes.dart';
import 'package:blog_system_app/component/widget_custom.dart';
import 'package:blog_system_app/controller/Animation_controller/registerAnimation/signup_animation_screen.dart';
import 'package:blog_system_app/controller/Register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<RegisterController>();

  @override
  void initState() {
    SignUpAnimationScreen.animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    SignUpAnimationScreen.animationController.forward();

    SignUpAnimationScreen.animationContainerSignUp = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: SignUpAnimationScreen.animationController,
        curve: Curves.elasticInOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SlideTransition(
        position: SignUpAnimationScreen.animationContainerSignUp,
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
                          'Create an account',
                          style: LightTextStyleApp.textTitleLarge,
                        ),
                      ),
                      ValueSizes.low.height,
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sign Up with your Email',
                          style: LightTextStyleApp.textNamesSmall,
                        ),
                      ),
                      (ValueSizes.high + 1).height,
                      //Username
                      Obx(
                        () => AppTextField(
                          controller: controller,
                          controllerTextEditing:
                              controller.textUserNameEditingController,
                          position: 'username',
                          icon:
                              controller.username.value
                                  ? const Icon(Icons.check, color: Colors.green)
                                  : const Icon(Icons.person),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.username.value = true;
                            } else {
                              controller.username.value = false;
                            }
                          },
                        ),
                      ),

                      ValueSizes.veryhigh.height,
                      //Email
                      Obx(
                        () => AppTextField(
                          controller: controller,
                          controllerTextEditing:
                              controller.textEmailEditingController,
                          position: 'Email',
                          icon:
                              controller.isEmailOk.value
                                  ? const Icon(Icons.check, color: Colors.green)
                                  : const Icon(Icons.email),
                          onChanged: (value) {
                            if (value.isEmail) {
                              controller.isEmailOk.value = true;
                            } else {
                              controller.isEmailOk.value = false;
                            }
                          },
                        ),
                      ),
                      ValueSizes.veryhigh.height,
                      //password
                      TextField(
                        onChanged: (value) {
                          if (value.length >= 7) {
                            controller.isPassportOk.value = true;
                          } else {
                            controller.isPassportOk.value = false;
                          }
                        },

                        obscureText: controller.obscureTextBool.value,
                        style: LightTextStyleApp.textSubjectDarkTextStyle,
                        cursorHeight: 18,
                        cursorWidth: 1,
                        expands: false,
                        controller: controller.textPasswordUPEditingController,
                        decoration: InputDecoration(
                          icon:
                              controller.isPassportOk.value
                                  ? const Icon(Icons.check, color: Colors.green)
                                  : const Icon(Icons.lock),
                          labelStyle:
                              LightTextStyleApp.textLableandTitleTextStyle,
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

                              style:
                                  LightTextStyleApp.textLableandTitleTextStyle,
                            ),
                          ),
                        ),
                      ),
                      ValueSizes.veryhigh.height,
                      //Submit_Button
                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: WidgetStatePropertyAll(
                            Size(Get.width / 1.2, Get.height / 13.53),
                          ),
                        ),
                        onPressed: () {
                          if (controller.isEmailOk.value) {
                            //create_account
                            controller.signUpWithEmailAndPassword();
                          } else {
                            Get.snackbar('Error', 'email nothing');
                          }
                        },
                        child: const Text(
                          'CREATE',
                          style:
                              LightTextStyleApp.textLableandTitleWhiteTextStyle,
                        ),
                      ),

                      const SizedBox(height: 30),
                      const Text(
                        'Or sign in with',
                        style: LightTextStyleApp.textLableandTitleTextStyle,
                      ),
                      const Row(children: [

                        ],
                      ),
                    ],
                  ),
                );
              },
              animation: SignUpAnimationScreen.animationController,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SignUpAnimationScreen.animationController.dispose();

    super.dispose();
  }
}
