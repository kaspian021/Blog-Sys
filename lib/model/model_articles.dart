

class ModelArticles {
  int id;
  String writer;
  String name;
  int price;
  String date;
  String image_path;
  String desc;
  String category;
  int like;

  ModelArticles({
    required this.id,
    required this.category,
    required this.name,
    required this.writer,
    required this.date,
    required this.desc,
    required this.image_path,
    required this.price,
    required this.like,
  });

  factory ModelArticles.fromJson(Map<String, dynamic> element) {
    int idElement = element['id'];
    String writerElement = element['writer'];
    String nameElement = element['name'];
    int priceElement = element['price'];
    String dateElement = element['date_element'];
    String imagePathElement = element['image_path'];
    String descElement = element['desc'];
    String categoryElement = element['category'];
    int likeElement = element['like'];

    return ModelArticles(
      id: idElement,
      category: categoryElement,
      name: nameElement,
      writer: writerElement,
      date: dateElement,
      desc: descElement,
      image_path: imagePathElement,
      price: priceElement,
      like: likeElement,
    );
  }

  Map<String,dynamic> toMap(){

    return {
      'id':id,
      'category':category,
      'name':name,
      'writer':writer,
      'date':date,
      'desc':desc,
      'image_path':image_path,
      'price':price,
      'like':like,
    };


  }
}
