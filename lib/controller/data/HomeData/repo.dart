import 'package:blog_system_app/controller/data/HomeData/src.dart';
import 'package:blog_system_app/model/model_home_data.dart';

abstract class IRepositoryHomeData{
  Future<ModelHomeData?> homePage();
}

class RepoHomeData implements IRepositoryHomeData{

  final IDataSourceHomeData iDataSourceHomeData;

  RepoHomeData(this.iDataSourceHomeData);

  

  @override
  Future<ModelHomeData?> homePage()=> iDataSourceHomeData.homePage();
}
class RepoHomeDataOfline implements IRepositoryHomeData{

  final IDataSourceHomeData iDataSourceHomeData;

  RepoHomeDataOfline(this.iDataSourceHomeData);

  

  @override
  Future<ModelHomeData?> homePage()=> iDataSourceHomeData.homePage();
}



final IRepositoryHomeData repoHomeDataOnline = RepoHomeData(SrcHomeData());
final IRepositoryHomeData repoHomeDataOfline = RepoHomeDataOfline(SrcHomeData()); // این رو بعدا باید تغیر بدی به دلیل این که این دیتا سورس برای ریپازیتوری افلاین نیست
