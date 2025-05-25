


class ModelArticlesSingle {


  String? content;
  


  ModelArticlesSingle({this.content,});


  ModelArticlesSingle.fromJson(Map<String,dynamic> element){
    var info= element['info'];
    content = info['content'];
    

  }


}