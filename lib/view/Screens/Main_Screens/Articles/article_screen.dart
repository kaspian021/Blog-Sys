
import 'package:blog_system_app/component/elements.dart';
import 'package:blog_system_app/component/temps.dart';
import 'package:blog_system_app/controller/Main_Screens/article_controller.dart';
import 'package:blog_system_app/controller/Main_Screens/home_controller.dart';
import 'package:blog_system_app/view/route_Screen/routs_name.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleScreen extends StatelessWidget {
  ArticleScreen({super.key});

  final controller = Get.find<HomeController>();
  final controllerArticle = Get.find<ArticleController>();

  @override
  Widget build(BuildContext context) {
    var sizeBody = MediaQuery.of(context).size.width / 10;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: sizeBody - 10, top: 20),
                  child: Text(
                    'Articles',
                    style: FontSized.fontMedium,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: Get.height/1.25,
          
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    var item= controller.listArticlesNews;
                    return Padding(
                      padding: EdgeInsets.only(
                        left: sizeBody-10,
                        right: sizeBody,
                        bottom: sizeBody,
                      ),
                      child: Obx(
                        () =>
                            !controller.isloading.value
                                ? GestureDetector(
                                  onTap: () {
                                    Get.toNamed(RoutsName.routeArticlesSingle,arguments: item[index]);
                                    controllerArticle.showArticleSingle(item[index].id!);
                                    
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: Get.height / 4.5,
                                        width: Get.width / 1.1,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 10.0,
                                              color: Colors.black12,
                                            ),
                                          ],
                                            
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      CachedNetworkImage(
                                        imageBuilder: (context, imageProvider) {
                                          return Container(
                                            width: Get.width / 2.7,
                                            height: Get.height / 4.5,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                20,
                                              ),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                        imageUrl:
                                            item[index].image!,
                                        errorWidget:
                                            (context, url, error) =>
                                                const Icon(Icons.image),
                                        placeholder: (context, url) => loading(),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 50),
                                            SizedBox(
                                              width: Get.width / 2.2,
                                            
                                              child: RichText(
                                                text: TextSpan(
                                                  text:item[index].title!,
                                            
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                : loading(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
