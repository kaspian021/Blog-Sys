
import 'dart:developer';
import 'package:blog_system_app/component/elements.dart';
import 'package:blog_system_app/component/service.dart';
import 'package:blog_system_app/controller/RouteManagment/routs_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool obscureTextBool = true.obs;
  RxBool username = false.obs;
  RxBool isEmailOk = false.obs;
  RxBool isPassportOk = false.obs;

  //GetStorage_box
  

  //Firebase_authentication
  final _firebaseAuth = FirebaseAuth.instance;

  TextEditingController textEmailEditingController = TextEditingController();
  TextEditingController textPasswordUPEditingController =TextEditingController();

  Future<void> signIngFirbaseWithEmailAndPassword() async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
            email: textEmailEditingController.text.trim(),
            password: textPasswordUPEditingController.text.trim(),
          );

      final User? user = userCredential.user;

      if (user != null) {
        Get.snackbar('Welcome', 'Welcome to account');
        WidgetsAndVariableStatic.box.write(SaveToken.token, user.uid);
        
        
        Get.offAndToNamed(RoutsName.routeHomeScreen);
      }
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Error Code: ${e.code}');
      switch (e.code) {
        case 'user-not-found':
          Get.snackbar('Error', "user_not_found");
          break;
        case 'wrong-password':
          Get.snackbar('Error', "wrong-password");
          break;
        case 'invalid-email':
          Get.snackbar('Error', "invalid-email");
          break;
        case 'user-disabled':
          Get.snackbar('Error', "user-disabled");
          break;
        case 'too-many-requests':
          Get.snackbar('Error', "You have tried too many times. Please try again later.");
          break;
        case 'invalid-credential':
          Get.snackbar('Error', "email or password wrong");
          break;
        case 'network-request-failed':
          Get.snackbar('Error', "connection lost");
          break;
        default:
          Get.snackbar('Error', 'Error Login');
          break;
      }
    } catch (e) {
      log(e.toString());
    }
  }


}

