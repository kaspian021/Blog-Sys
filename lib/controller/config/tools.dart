import 'package:blog_system_app/controller/database/shared_preferences.dart';

class Tools {





   Future<bool> checkSharedPrefence(String key,Type type)async{
    
    final SharedPreferencesApp prefe =  SharedPreferencesApp.instance; 
    bool? result;
    if(type is String){
      if(await prefe.getString(key)==null){
        result =false;
      }
      result =true;
    }else if(type is bool){
      if(await prefe.getBool(key)==null){
          result = false;
      }
      result =true;
    }else if(type is int){
      if(await prefe.getint(key)==null){
          result = false;
      }
      result =true;
    }

    return result!;
    
  }


}