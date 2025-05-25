
import 'package:blog_system_app/controller/Animation_controller/registerAnimation/signup_animation_screen.dart';
import 'package:blog_system_app/controller/Register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
    required this.textStyle,

  });
  // ignore: prefer_typing_uninitialized_variables
  final textStyle;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  
  
  final controller= Get.find<RegisterController>();

  @override
  void initState() {
    SignUpAnimationScreen.animationController=AnimationController(
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
                  ()=> Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Create an account',
                          style: widget.textStyle.bodyLarge,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sign Up with your Email',
                          style: widget.textStyle.bodySmall,
                        ),
                      ),
                      const SizedBox(height: 16),
                      //Username
                      TextField(
                        onChanged: (value) {
                          if(value.isNotEmpty){
                            controller.username.value=true;
                          }else{
                            controller.username.value=false;
                          }
                        },
                        style: widget.textStyle.titleSmall,
                        cursorHeight: 18,
                        cursorWidth: 1,
                        expands: false,
                        controller: controller.textUserNameEditingController,
                        decoration: InputDecoration(
                          icon: controller.username.value? const Icon(Icons.check,color: Colors.green,) :const Icon(Icons.person),
                          labelStyle: widget.textStyle.titleMedium,
                          label: const Text('Username'),
                          fillColor: Colors.black,
                          hoverColor: Colors.black,
                          contentPadding: const EdgeInsets.only(left: 2),
                          hintFadeDuration: const Duration(seconds: 1),
                        ),
                      ),
                      const SizedBox(height: 20),
                      //Email
                      TextField(
                        onChanged: (value) {
                          
                          if(value.isEmail){

                            controller.isEmailOk.value=true;
                          }else{
                            controller.isEmailOk.value=false;
                          }

                        },
                        style: widget.textStyle.titleSmall,
                        cursorHeight: 18,
                        cursorWidth: 1,
                        expands: false,
                        controller: controller.textEmailEditingController,
                        decoration: InputDecoration(
                          icon: controller.isEmailOk.value? const Icon(Icons.check,color: Colors.green,): const Icon(Icons.email),
                          labelStyle: widget.textStyle.titleMedium,
                          label: const Text('Email'),
                          fillColor: Colors.black,
                          hoverColor: Colors.black,
                          contentPadding: const EdgeInsets.only(left: 2),
                          hintFadeDuration: const Duration(seconds: 1),
                        ),
                      ),
                      const SizedBox(height: 20),
                      //password
                      TextField(
                        onChanged: (value) {
                          
                          if(value.length >=7){

                            controller.isPassportOk.value=true;
                          }else{
                            controller.isPassportOk.value=false;
                          }

                        },
                        
                        obscureText: controller.obscureTextBool.value,
                        style: widget.textStyle.titleSmall,
                        cursorHeight: 18,
                        cursorWidth: 1,
                        expands: false,
                        controller: controller.textPasswordUPEditingController,
                        decoration: InputDecoration(
                          icon: controller.isPassportOk.value? const Icon(Icons.check,color: Colors.green,): const Icon(Icons.lock),
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
                              controller.obscureTextBool.value ? 'show' : 'Hide',
                              
                                  style: widget.textStyle.titleMedium,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      //Submit_Button
                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: WidgetStatePropertyAll(
                            Size(Get.width / 1.2, Get.height / 13.53),
                          ),
                        ),
                        onPressed: () {
                          if(controller.isEmailOk.value){

                            //create_account
                            controller.signUpWithEmailAndPassword();

                          }else{
                            Get.snackbar('Error', 'email nothing');
                          }
                          
                        },
                        child: Text('CREATE', style: widget.textStyle.titleLarge),
                      ),
                      
                      
                      const SizedBox(height: 30),
                      Text('Or sign in with',
                                  style: widget.textStyle.titleMedium,),
                      const Row(
                        children: [

                        ],
                      )
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
