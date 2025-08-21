//import blog_system_app
import 'package:blog_system_app/component/elements.dart';
import 'package:blog_system_app/component/extension_app.dart';
import 'package:blog_system_app/component/temps.dart';
import 'package:blog_system_app/component/value_sizes.dart';
import 'package:blog_system_app/controller/Main_Screens/Articles/article_controller.dart';
import 'package:blog_system_app/gen/assets.gen.dart';
import 'package:blog_system_app/model/model_articles.dart';

//import packages
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pull_down_button/pull_down_button.dart';

class ArticleSingleScreen extends StatelessWidget {

  
  late final ModelArticles modelHomeNewArticles;
  final controller = Get.find<ArticleController>();

  

  ArticleSingleScreen({super.key}) {
    modelHomeNewArticles = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    var sizeBody = MediaQuery.of(context).size.width / 10;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  //appBar ScreenArticleSingle
                  Padding(
                    padding: EdgeInsets.only(
                      left: sizeBody,
                      right: sizeBody,
                      top: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         IconButton( onPressed: () { 

                          Get.back();
                         }, icon: const Icon(Icons.arrow_back_ios_new_rounded),),
                        PullDownButton(
                          itemBuilder:
                              (context) => [
                                PullDownMenuItem(onTap: () {}, title: 'copy',),
                              ],
                          buttonBuilder: (context, showMenu) {
                            return IconButton(
                              onPressed: () => showMenu,
                              icon: const Icon(CupertinoIcons.ellipsis),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  //TitleArticleSingle
                  Padding(
                    padding: EdgeInsets.only(
                      left: sizeBody,
                      right: sizeBody,
                      top: 20,
                    ),
                    child: Text(
                      modelHomeNewArticles.title!,
                      style: FontSized.fontMedium,
                    ),
                  ),

                  //save and share Post, and viewProfile User
                  Padding(
                    padding: EdgeInsets.only(
                      left: sizeBody,
                      right: sizeBody,
                      top: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            //imageProfileUser author
                            Container(
                              height: Get.height / 23,
                              width: Get.width / 11,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                image: DecorationImage(
                                  image: AssetImage(Assets.images.laptop.path),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                            ValueSizes.high.width,

                            //userName author and date write Article
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  modelHomeNewArticles.author!,
                                  style: FontSized.fontLow,
                                ), //userName author test,
                                const SizedBox(height: 4),
                                Text(
                                  modelHomeNewArticles.createdAt ?? 'null',
                                  style: FontSized.fontVeryLow,
                                ), //date Write
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            //share with sharePluse
                            IconButton(
                              onPressed: () {
                                //sharePluse
                              },
                              icon: ImageIcon(
                                Assets.icons.vector.provider(),
                                color: ColorsConst.colorPrimery,
                                size: 18,
                              ),
                            ),
                            //save Sql article to profile forward
                            IconButton(
                              onPressed: () {
                                //save_Hive_ArticleSingleScreen
                              },
                              icon: const Icon(
                                Icons.bookmark_outline_outlined,
                                color: ColorsConst.colorPrimery,
                                size: 22,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ValueSizes.veryMedium.height,
                  //Article_image
                  CachedNetworkImage(
                    imageUrl: modelHomeNewArticles.image!,

                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: Get.height / 3.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      );
                    },

                    placeholder: (context, url) => loading(),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.image),
                  ),
                  ValueSizes.high.height,
                  //Article_content
                  Obx(
                    () =>
                        !controller.isloading.value
                            ? Padding(
                              padding: EdgeInsets.only(
                                left: sizeBody,
                                right: sizeBody,
                              ),
                              child: Text(
                                controller.contentArticleSingle.value.content!,
                                style: FontSized.fontLow,
                              ),
                            )
                            : loading(),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
            Positioned(
              height: Get.height / 9,
              bottom: 0,

              child: Container(
                width: Get.width,
                decoration: const BoxDecoration(
                  
                  gradient: LinearGradient(
                    colors: ColorsConst.bottomNavigationLikeArticle,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: LikeArticleContainer(
                  sizeBody: sizeBody,
                ), //class animation like Article
              ),
            ),
          ],
        ),
      ),
    );
  }
}
