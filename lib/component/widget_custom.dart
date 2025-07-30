import 'package:blog_system_app/component/temps.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
   const AppTextField({
    super.key,
    
    
    required this.position,
    required this.controllerTextEditing,
    required this.icon,
    required this.onChanged
  });
  final String position;
  final TextEditingController controllerTextEditing;
  final Widget icon;
  final void Function(String value) onChanged;
  

  @override
  Widget build(BuildContext context) {
    var textStyle= Theme.of(context).textTheme;
    return TextField(
      onChanged: (value) => onChanged,
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


