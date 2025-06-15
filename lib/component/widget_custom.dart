import 'package:blog_system_app/component/temps.dart';
import 'package:blog_system_app/controller/Register/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller= LoginController,
    
    required this.position,
    required this.controllerTextEditing,
    required this.icon,
  });

  final dynamic controller;
  final String position;
  final TextEditingController controllerTextEditing;
  final Widget icon;
  

  @override
  Widget build(BuildContext context) {
    var textStyle= Theme.of(context).textTheme;
    return TextField(
      onChanged: (value) {
        switch (position) {
          case "username":
            if (value.isNotEmpty) {
              controller.username.value = true;
            } else {
              controller.username.value = false;
            }
            break;
          case "isEmailOk":
            if (value.isEmail) {
              controller.isEmailOk.value = true;
            } else {
              controller.isEmailOk.value = false;
            }
            break;
          case "isPassportOk":
            if (value.length >= 7) {
              controller.isPassportOk.value = true;
            } else {
              controller.isPassportOk.value = false;
            }
            break;
        }
      },
      style: textStyle.titleSmall,
      cursorHeight: 18,
      cursorWidth: 1,
      expands: false,
      controller: controllerTextEditing,
      decoration: InputDecoration(
        icon: icon,
            
        labelStyle: textStyle.titleMedium,
        label: Text(position),
        fillColor: Colors.black,
        focusColor: ColorsConst.colorPrimery,
        hoverColor: Colors.black,
        contentPadding: const EdgeInsets.only(left: 2),
        hintFadeDuration: const Duration(seconds: 1),
      ),
    );
  }
}
