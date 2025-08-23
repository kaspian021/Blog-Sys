import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesApp {

  SharedPreferencesApp.init();

  static final SharedPreferencesApp instance = SharedPreferencesApp.init();

  static SharedPreferences? _prefe;

  factory SharedPreferencesApp (){

    return instance;
  }


  Future<SharedPreferences?> get init async{
    if(_prefe!=null) return _prefe;
    _prefe = await SharedPreferences.getInstance();

    return _prefe;
  }

  Future<String?> getString(String key)async{
    final shared= await init;

    try {
      String? result_key = await shared?.getString(key);
    if(result_key!=null){
      return result_key;
    }
    return null;
    } catch (e) {
      log('Error SharedPreferencesApp: getString : $e');
     return  null;
    }
    
  }
  Future<bool?> getBool(String key)async{
    final shared= await init;

    try {
      bool? resultKey = shared?.getBool(key);
    if(resultKey!=null){
      return resultKey;
    }
    return null;
    } catch (e) {
      log('Error SharedPreferencesApp: getString : $e');
     return  null;
    }
    
  }
  Future<int?> getint(String key)async{
    final shared= await init;

    try {
      int? resultKey = shared?.getInt(key);
    if(resultKey!=null){
      return resultKey;
    }
    return null;
    } catch (e) {
      log('Error SharedPreferencesApp: getString : $e');
     return  null;
    }
    
  }
  
  Future setValidation(String key,value)async{
    final shared = await init;
    if(value is String){
      await shared?.setString(key, value);
    }else if(value is int){
      await shared?.setInt(key, value);
    }else if(value is bool){
      await shared?.setBool(key, value);
    }

  }



  

}