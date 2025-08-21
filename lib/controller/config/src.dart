import 'package:blog_system_app/model/model_articles.dart';

abstract class IDataSource{
  Future<List<ModelArticles>> getProductAll();
  Future<List<ModelArticles>> getProdoctShowBest();
  Future<List<ModelArticles>> getProdoctById(int id);
  
}

class DataSource implements IDataSource{
  @override
  Future<List<ModelArticles>> getProdoctById(int id) {
    
    
  }

  @override
  Future<List<ModelArticles>> getProdoctShowBest() {

  }

  @override
  Future<List<ModelArticles>> getProductAll() {

  }


}