import 'package:blog_system_app/controller/Main_Screens/Articles/article_write_controller.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';


class SaveToken {
  SaveToken._();
  //save Specifications users
  static String token = 'token';
  static String userName = 'username';
  static String email = 'Email';
  static String nameBisines= 'nameBisines';
}


//selctFile for App
class SelectFile{

  
  selectImageFile(FileType typeFile)async{

    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if(result!=null){
      controller.fileImage= result.files.first;
      controller.selectImage.value=true;
    }else{
      controller.selectImage.value= false;
    }

  }
  
}
