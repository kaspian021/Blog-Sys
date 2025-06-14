
import 'dart:developer';

import 'package:blog_system_app/component/service.dart';
import 'package:blog_system_app/controller/RouteManagment/routs_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {

  
  RxBool obscureTextBool = true.obs;
  RxBool username = false.obs;
  RxBool isEmailOk = false.obs;
  RxBool isPassportOk = false.obs;

  //GetStorage_box
  final box= GetStorage();


  //Firebase_authentication
  final _firebaseAuth= FirebaseAuth.instance;

  TextEditingController textUserNameEditingController = TextEditingController();
  TextEditingController textEmailEditingController = TextEditingController();
  TextEditingController textPasswordUPEditingController = TextEditingController();

  Future<void> signUpWithEmailAndPassword() async {
  try {
    final UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(

      email: textEmailEditingController.text.trim(),
      password: textEmailEditingController.text.trim(),
    );
    final User? user = userCredential.user;
    if (user != null) {
      
      log('User signed up: ${user.uid}');
      
      

      if (!user.emailVerified) {
        await user.sendEmailVerification();
        Get.snackbar('Submit', "sendEmailVerification");
        box.write(SaveToken.token, user.uid);
        box.write(SaveToken.userName, textUserNameEditingController.text);
        box.write(SaveToken.email, textEmailEditingController.text);
        
        Get.offAndToNamed(RoutsName.routeHomeScreen);
      }
     
    }
  } on FirebaseAuthException catch (e) {
    
    log('Error signing up: ${e.code}');
    
    switch (e.code) {
      case 'weak-password':
        Get.snackbar('Error', "weak-password");
        break;
      case 'email-already-in-use':
        Get.snackbar('Error', "email-already-in-use"); 
        break;
      case 'invalid-email':
        Get.snackbar('Error', "invalid-email"); 
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
        Get.snackbar('Error', "Error Authentication"); 
        break;
    }
    
  } catch (e) {
    log(e.toString());
    
  }
  }
  

}