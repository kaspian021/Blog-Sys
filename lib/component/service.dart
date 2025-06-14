import 'package:blog_system_app/controller/Main_Screens/Articles/article_write_controller.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';


class SaveToken {
  SaveToken._();
  //save Specifications users
  static String token = 'token';
  static String userName = 'username';
  static String email = 'Email';
  static String nameBisines= 'nameBisines';
}

class ServiceApi {
  final dio = Dio();
  //Get Method for request in programme
  Future<dynamic> getApi(String url) async {
    return await dio.get(
          url,
          options: Options(responseType: ResponseType.json, method: "GET"),
        ).then((respons) {
          return respons;
        });
  }
  
}
//selctFile for App
class SelectFile{

  var controller= Get.put(ArticleWriteController());
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
