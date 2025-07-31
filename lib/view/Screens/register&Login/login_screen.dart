import 'package:blog_system_app/component/extension_app.dart';
import 'package:blog_system_app/component/text_style_app.dart';
import 'package:blog_system_app/component/value_sizes.dart';
import 'package:blog_system_app/component/widget_custom.dart';
import 'package:blog_system_app/controller/Animation_controller/registerAnimation/login_animation_screen.dart';
import 'package:blog_system_app/controller/RouteManagment/routs_name.dart';
import 'package:blog_system_app/service/service_tools.dart';
import 'package:blog_system_app/view/Screens/register&Login/cubit/authapp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// ignore: must_be_immutable

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController textEmailEditingController =
      TextEditingController();
  final TextEditingController textPasswordEditingController =
      TextEditingController();
  bool isEmailOk = false;
  bool isPassportOk = false;
  bool obscureTextBool = true;

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
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: SlideTransition(
        position: LoginAnimationScreen.animationContainerLogin,
        child: Container(
          width: double.infinity,
          height: size.height / 2.16,
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
                return  Column(
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
                      (ValueSizes.high + 1).height,
                      //Email
                       AppTextField(
                          controllerTextEditing: textEmailEditingController,
                          position: 'Email',
                          icon:
                              isEmailOk
                                  ? const Icon(Icons.check, color: Colors.green)
                                  : const Icon(Icons.email),
                          onChanged: (value) {
                            setState(() {
                              if (value.isEmail) {
                                isEmailOk = true;
                              } else {
                                isEmailOk = false;
                              }
                            });
                          },
                        ),
                      
                      (ValueSizes.veryhigh + 15).height,
                      //password
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            if (value.length >= 10) {
                              isPassportOk = true;
                            } else {
                              isPassportOk = false;
                            }
                          });
                        },

                        obscureText: obscureTextBool,
                        style: LightTextStyleApp.textNamesSmall,
                        cursorHeight: 18,
                        cursorWidth: 1,
                        expands: false,
                        controller: textPasswordEditingController,
                        decoration: InputDecoration(
                          icon:
                              isPassportOk
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
                              setState(() {
                                obscureTextBool
                                    ? obscureTextBool = false
                                    : obscureTextBool = true;
                              });
                            },
                            child: Text(
                              obscureTextBool ? 'show' : 'Hide',
                              style:
                                  LightTextStyleApp.textLableandTitleTextStyle,
                            ),
                          ),
                        ),
                      ),
                      (ValueSizes.veryhigh + 10).height,
                      BlocConsumer<AuthappCubit, AuthappState>(
                        listener: (context, state) {
                          if(state is SendSmsState){
                            Navigator.of(context).pushReplacementNamed(RoutsName.routeHomeScreen);
                            
                          }else if(state is ErrorState){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('خطا در ورود به سیستم' )));
                          }
                        },
                        builder: (context, state) {
                          if (state is LoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<AuthappCubit>(
                                context,
                              ).sendSmsEmail(
                                textEmailEditingController.text,
                                textPasswordEditingController.text,
                              );
                            },
                            child: const Text(
                              'LOGIN',
                              style:
                                  LightTextStyleApp
                                      .textLableandTitleWhiteTextStyle,
                            ),
                          );
                        },
                      ),
                      (ValueSizes.veryhigh + 20).height,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Forgot your password?',
                            style: LightTextStyleApp.textLableandTitleTextStyle,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Reset here',
                            style: LightTextStyleApp.textLableandTitleTextStyle,
                          ),
                        ],
                      ),
                      ValueSizes.veryhigh.height,
                      const Text(
                        'Or sign in with',

                        style: LightTextStyleApp.textLableandTitleTextStyle,
                      ),
                    ],
                  
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
