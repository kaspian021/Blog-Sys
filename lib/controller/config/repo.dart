import 'package:blog_system_app/controller/config/src.dart';
import 'package:blog_system_app/model/model_articles.dart';

abstract class IRepozitory{
  Future<List<ModelArticles>> getProductAll();
  Future<List<ModelArticles>> getProdoctShowBest();
  Future<ModelArticles?> getProdoctById(int id);
  
}

class RepositoryData implements IRepozitory{

  final DataSource productResponseDataSource;

  RepositoryData({required this.productResponseDataSource});


  @override
  Future<ModelArticles?> getProdoctById(int id) async => productResponseDataSource.getProdoctById(id);

  @override
  Future<List<ModelArticles>> getProdoctShowBest() async => productResponseDataSource.getProdoctShowBest();

  @override
  Future<List<ModelArticles>> getProductAll() async => productResponseDataSource.getProductAll();

}