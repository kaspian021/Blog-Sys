
import 'package:blog_system_app/component/elements.dart';
import 'package:blog_system_app/service/service_tools.dart';
import 'package:blog_system_app/component/temps.dart';
import 'package:blog_system_app/component/text_style_app.dart';

import 'package:blog_system_app/gen/assets.gen.dart';
import 'package:blog_system_app/controller/RouteManagment/routs_name.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
    HomePage(
    {super.key}
  );

  






  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    var sizeBody= size.width/12;
    return  SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            //appbar
            Padding(
              padding: EdgeInsets.fromLTRB(
                sizeBody,
                size.height / 20,
                sizeBody,
                10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Hi, ${!CheckLoginController.isLogin ? box.read(SaveToken.userName) : null}',
                      style: LightTextStyleApp.textLableandTitleTextStyle,
                    ), //username
                  ),
                  const Icon(Icons.notifications_active_outlined),
                ],
              ),
            ),
            const SizedBox(height: 10),
            //Top seller relativ to the Articles
            Padding(
              padding: EdgeInsets.only(left: sizeBody),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("Top Seller's", style: LightTextStyleApp.textTitleLarge),
              ),
            ),
            const SizedBox(height: 10),
            //list_Sellers
            SizedBox(
              height: Get.height / 7.5,
      
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, //test
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? sizeBody : 20,
                      right: index == 9 ? sizeBody : 0,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: Get.width / 5.54,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2),
      
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: Get.height / 160.94,
                              left: Get.width / 70.94,
                              bottom: Get.height / 160.94,
                              right: Get.width / 70.94,
                            ),
                            child: Container(
                              height: Get.height / 11.94,
                              width: Get.width / 6.94,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                image: DecorationImage(
                                  image: AssetImage(Assets.images.graphic.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text('name', style: LightTextStyleApp.textNamesSmall), //Names Sellers
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 35),
            //list subject articles
            SizedBox(
              height: Get.height / 2.97,
      
              child: ListView.builder(
                primary: false,
      
                itemCount: 5, //test
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? sizeBody : 15,
                      right: index == 4 ? sizeBody : 10,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: Get.height / 2.97,
                          width: Get.width / 1.58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(Assets.images.motherBoard.path),
                              fit: BoxFit.fill,
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: ColorsConst.topSubjectArticles,
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: Get.width / 2, left: 20),
                          child: const Text(
                            'Technology',
                            style: LightTextStyleApp.textSubjectTextStyle,
                          ), //Names topSubjectArticles
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            //News Articles
            Padding(
              padding: EdgeInsets.only(left: sizeBody, right: sizeBody),
              child: Row(
                children: [
                  const Expanded(
                    child: Text('Latest News', style: LightTextStyleApp.textSubjectDarkTextStyle),
                  ),
                  GestureDetector(
                    onTap: () => _homeController.colorIcon.value=1,
                    child: const Text(
                      'More',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            //list_News_Articles
            Obx(
              () =>
                  !_homeController.isloading.value
                      ? Column(
                        children:
                            _homeController.listArticlesTopVisited
                                .map(
                                  (f) =>
                                      _buildArticleItem(f, sizeBody),
                                ) //list_neverScroller with Column
                                .toList(),
                      )
                      : loading(),
            ),
          ],
        ),
    
    );
  }
  
  //Articles_New
  Widget _buildArticleItem(article, sizeBody) {
    return Padding(
      padding: EdgeInsets.only(
        left: sizeBody,
        right: sizeBody,
        bottom: sizeBody,
      ),
      child: Obx(
        () =>
            !_homeController.isloading.value
                ? GestureDetector(
                  onTap: () {
                      //id send article with arguament Articles Single
                      controllerArticleSingle.showArticleSingle(article.id);
                      Get.toNamed(RoutsName.routeArticlesSingle,arguments: article);
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height / 4.5,
                        width: Get.width / 1.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(blurRadius: 10.0, color: Colors.black12),
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
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(article.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        imageUrl: article.image,
                        errorWidget:
                            (context, url, error) => const Icon(Icons.image),
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
                                  text: article.title,
                  
                                  style: LightTextStyleApp.titleArticleTextStyle
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
  }
}