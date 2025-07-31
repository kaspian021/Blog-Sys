

import 'package:blog_system_app/service/get_names_url.dart';

class ModelHomeNewArticles {

  String? title;
  String?  image;
  int?  view;
  String? createdAt;
  String? author;
  String? id;
  String? content;
  


  ModelHomeNewArticles({required this.title,required this.image,required this.view,required this.createdAt,required this.author,required this.id,required this.content,});


  ModelHomeNewArticles.fromJson(Map<String,dynamic> element){

    id = element['id'];
    title = element['title'];
    content = element['content'];
    createdAt = element['created_at'];
    author = element['author'];
    view = int.parse(element['view']);
    image = GetNamesUrl.baseAPI+ element['image'];

  }


}