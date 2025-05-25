import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_storage/get_storage.dart';

Widget loading() {
  return const SpinKitCircle(
    color: Colors.blue,
    size: 30,
    duration: Duration(milliseconds: 300),
  );
}

class WidgetsAndVariableStatic {

  WidgetsAndVariableStatic._();

  static final box= GetStorage();

}

